-- Project-wide symbol picker (classes, functions, methods) over the gutentags tags file.
--
-- Why ctags and not LSP workspace symbols (measured 2026-11 on the hub repo, ~22k tags):
-- * basedpyright answers workspace/symbol in 270 ms to 2.3 s per query.
-- * ty answers in ~3 ms when warm, but returns nothing for an empty query, so it can only
--   drive a live picker where ty ranks the results (it ranks "Money" below fields that
--   merely contain the letters), and it needs an indexed Python buffer first. `gS` keeps
--   the live LSP picker.
--
-- Rendering the tags file with scripts/tag_symbols.awk takes ~95 ms with macOS awk, so the
-- rendered lines are cached and re-rendered in the background on every gutentags update.
-- The picker then only runs `cat` on the cache.
local M = {}

local kinds = {
  c = { icon = "󰠱", hl = { "@type", "Type" } },
  f = { icon = "󰊕", hl = { "@function", "Function" } },
  m = { icon = "󰆧", hl = { "@function.method", "@method", "Function" } },
}

local script = vim.fs.joinpath(vim.fn.stdpath("config"), "scripts", "tag_symbols.awk")
local cache_dir = vim.fs.joinpath(vim.fn.stdpath("cache"), "tag_symbols")

local function tags_file()
  local file = vim.fn.tagfiles()[1]
  if file then
    return vim.fn.fnamemodify(file, ":p")
  end
  local root = vim.fs.root(0, "tags")
  return root and vim.fs.joinpath(root, "tags") or nil
end

-- ANSI escape sequence for the first of `groups` that resolves to a highlight.
local function ansi(groups)
  for _, group in ipairs(groups) do
    local _, escseq = require("fzf-lua.utils").ansi_from_hl(group, "")
    if escseq then
      return escseq
    end
  end
  return ""
end

-- awk argv that renders `file` with the current colorscheme.
local function awk_argv(file)
  local vars = {
    SEP = require("fzf-lua.utils").nbsp,
    DIM = ansi({ "Comment" }),
    RESET = "\27[0m",
  }
  for kind, spec in pairs(kinds) do
    vars["ICON_" .. kind] = spec.icon
    vars["HL_" .. kind] = ansi(spec.hl)
  end
  local argv = { "awk" }
  -- Sorted, as the argv is also the cache key.
  local names = vim.tbl_keys(vars)
  table.sort(names)
  for _, name in ipairs(names) do
    vim.list_extend(argv, { "-v", name .. "=" .. vars[name] })
  end
  vim.list_extend(argv, { "-f", script, file })
  return argv
end

-- The cache file name covers everything the output depends on, so a colorscheme or
-- script change renders to a new file instead of serving stale lines.
local function cache_file(argv)
  local stat = vim.uv.fs_stat(script)
  local key = table.concat(argv, "\0") .. (stat and stat.mtime.sec or "")
  return vim.fs.joinpath(cache_dir, vim.fn.sha256(key))
end

local function mtime_ns(path)
  local stat = vim.uv.fs_stat(path)
  return stat and stat.mtime.sec * 1e9 + stat.mtime.nsec or nil
end

local function is_fresh(cache, file)
  local cache_mtime = mtime_ns(cache)
  return cache_mtime ~= nil and cache_mtime >= mtime_ns(file)
end

-- Render the tags file of the current buffer into the cache in the background.
function M.refresh()
  local file = tags_file()
  if not file or vim.fn.filereadable(file) == 0 then
    return
  end
  local argv = awk_argv(file)
  local cache = cache_file(argv)
  vim.fn.mkdir(cache_dir, "p")
  -- Write to a temporary file first so the picker never reads a partial cache.
  local tmp = cache .. ".tmp"
  vim.system({ "sh", "-c", 'out="$1"; shift; "$@" > "$out.tmp" && mv "$out.tmp" "$out"', "sh", cache, unpack(argv) },
    {}, function(result)
      if result.code ~= 0 then
        vim.uv.fs_unlink(tmp)
      end
    end)
end

function M.pick()
  local file = tags_file()
  if not file or vim.fn.filereadable(file) == 0 then
    vim.notify("No tags file found; gutentags has not generated one yet", vim.log.levels.WARN)
    return
  end

  local argv = awk_argv(file)
  local cache = cache_file(argv)
  local cmd
  if is_fresh(cache, file) then
    cmd = "cat " .. vim.fn.shellescape(cache)
  else
    cmd = table.concat(vim.tbl_map(vim.fn.shellescape, argv), " ")
    M.refresh()
  end

  local utils = require("fzf-lua.utils")
  require("fzf-lua").fzf_exec(cmd, {
    prompt = "Symbols> ",
    -- Tag paths are relative to the directory of the tags file.
    cwd = vim.fs.dirname(file),
    previewer = "builtin",
    -- The global `path.filename_first` formatter would rewrite the entries.
    formatter = false,
    -- The global `multiline = 1` default adds --read0, which would read the whole
    -- newline-separated list as a single entry.
    _multiline = false,
    actions = require("fzf-lua.config").globals.actions.files,
    fzf_opts = {
      ["--ansi"] = true,
      -- Match on the icon and qualified name only, not on the file path.
      ["--delimiter"] = utils.nbsp,
      ["--nth"] = "1",
    },
  })
end

return M
