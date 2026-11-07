-- Gutter with a 1-cell git sign bar left of the line numbers.
--
-- The built-in sign column is 2 cells wide, while gitsigns' signs are 1-cell
-- characters (┃ ▁ ▔ ~ ┆). This 'statuscolumn' draws the git sign in a single
-- cell instead, which saves one column. A sign from any other plugin (e.g.
-- neotest) is drawn in place of the line number on its line.
local M = {}

-- Namespace id -> whether it belongs to gitsigns. gitsigns creates its
-- namespaces lazily, so unknown ids trigger a rescan.
local is_git_ns = {}

local function git_namespace(ns_id)
  if is_git_ns[ns_id] == nil then
    for name, id in pairs(vim.api.nvim_get_namespaces()) do
      is_git_ns[id] = name:find("^gitsigns") ~= nil
    end
    is_git_ns[ns_id] = is_git_ns[ns_id] or false
  end
  return is_git_ns[ns_id]
end

-- Format a sign for the statuscolumn, with its highlight group.
local function format_sign(details, width)
  local text = vim.trim(details.sign_text)
  if width then
    text = vim.fn.strcharpart(text, 0, width)
  end
  text = text:gsub("%%", "%%%%")
  if details.sign_hl_group then
    return "%#" .. details.sign_hl_group .. "#" .. text .. "%*"
  end
  return text
end

function M.render()
  local win = vim.g.statusline_winid
  local buf = vim.api.nvim_win_get_buf(win)
  local row = vim.v.lnum - 1

  -- Highest-priority git sign and non-git sign on this line
  local git, other
  if vim.v.virtnum == 0 then
    local marks = vim.api.nvim_buf_get_extmarks(
      buf, -1, { row, 0 }, { row, -1 }, { details = true, type = "sign" }
    )
    for _, mark in ipairs(marks) do
      local details = mark[4]
      if details.sign_text then
        if git_namespace(details.ns_id) then
          if not git or details.priority > git.priority then
            git = details
          end
        elseif not other or details.priority > other.priority then
          other = details
        end
      end
    end
  end

  local bar = git and format_sign(git, 1) or " "
  local number = other and ("%=" .. format_sign(other)) or "%l"
  return bar .. number .. " "
end

function M.setup()
  -- Signs are drawn by render(), so hide the built-in sign column
  vim.opt.signcolumn = "no"
  vim.opt.statuscolumn = "%!v:lua.require'statuscolumn'.render()"
end

return M
