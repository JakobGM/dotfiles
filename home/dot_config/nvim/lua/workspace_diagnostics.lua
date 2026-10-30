-- On-demand workspace-wide Python diagnostics (basedpyright + ruff) shown in Trouble.
--
-- Why this exists (verified 2026-10 with Neovim 0.12.6 and basedpyright 1.39.10):
--
-- * basedpyright's `diagnosticMode = "workspace"` pushes diagnostics for every file
--   (~2000 in ~/crdbrd/hub). Neovim handles each push on the main loop, creating a buffer
--   per file, which freezes the UI. The LSP is therefore configured with "openFilesOnly".
-- * Neovim's `vim.lsp.buf.workspace_diagnostics()` would be the built-in replacement, but
--   it requires LSP pull diagnostics, which basedpyright does not support. Re-check with
--   `:lua =vim.lsp.get_clients({ name = "basedpyright" })[1].server_capabilities.diagnosticProvider`;
--   if that is non-nil with `workspaceDiagnostics = true`, this module can likely be
--   replaced by that function (followed by `:Trouble diagnostics`).
-- * ruff's LSP only ever diagnoses open files, so it has no workspace mode at all.
-- * `:make` with an errorformat is the built-in alternative, but it blocks the UI for
--   the duration of the run (~30s for basedpyright in hub). Hence `vim.system`.
local M = {}

-- The errorformats parse the CLIs' plain-text output, so they break if those formats change:
-- * basedpyright: "  <file>:<line>:<col> - error|warning|information: <message>", where
--   long messages continue on indented lines (which contain the rule name).
-- * ruff (concise): "<file>:<line>:<col>: <rule>: <message>". It has no severity.
local checks = {
  {
    cmd = { "basedpyright" },
    efm = "%E  %f:%l:%c - error: %m,%W  %f:%l:%c - warning: %m,%I  %f:%l:%c - information: %m,%C  %m,%-G%.%#",
  },
  {
    cmd = { "ruff", "check", "--output-format=concise", "--exit-zero" },
    efm = "%f:%l:%c: %m,%-G%.%#",
  },
}

function M.run()
  local root = vim.fs.root(0, { "pyproject.toml", "pyrightconfig.json" })
  if not root then
    vim.notify("No Python project root found", vim.log.levels.WARN)
    return
  end
  -- Prefer the tool versions pinned by the project (e.g. via uv) over global ones
  local env = { PATH = root .. "/.venv/bin:" .. vim.env.PATH }

  vim.fn.setqflist({}, " ", { title = "Workspace diagnostics" })
  local pending = #checks
  vim.notify("Running workspace diagnostics in " .. root .. " ...")
  for _, check in ipairs(checks) do
    vim.system(check.cmd, { cwd = root, env = env, text = true }, vim.schedule_wrap(function(result)
      vim.fn.setqflist({}, "a", { lines = vim.split(result.stdout, "\n"), efm = check.efm })
      pending = pending - 1
      if pending == 0 then
        vim.notify(("Workspace diagnostics: %d issues"):format(#vim.fn.getqflist()))
        require("trouble").open({ mode = "qflist" })
      end
    end))
  end
end

return M
