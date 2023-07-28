-- Automatically generate ctags on write
return {
  "ludovicchabant/vim-gutentags",
  config = function()
    -- Exclude file patterns
    vim.g.gutentags_ctags_exclude = {
      ".mypy_cache",
      "@.gitignore",
      "node_modules",
      ".direnv",
      ".venv",
    }
    vim.g.gutentags_ctags_extra_args = {
      "--kinds-python=cfmIix",
      "--languages=python",
    }
  end,
}
