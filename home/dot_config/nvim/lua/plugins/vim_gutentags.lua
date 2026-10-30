-- Automatically generate ctags on write
return {
  "ludovicchabant/vim-gutentags",
  config = function()
    -- Only tag files that are not ignored by git (project, nested, and global ignore files).
    -- ctags' own --exclude does not understand .gitignore syntax.
    vim.g.gutentags_file_list_command = "rg --files"
    vim.g.gutentags_ctags_extra_args = {
      "--kinds-python=cfmIix",
      "--languages=python",
    }

    -- Generate tags right after opening Neovim
    vim.g.gutentags_generate_on_empty_buffer = true
  end,
}
