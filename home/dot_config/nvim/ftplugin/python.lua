-- " Proper indentation for python files
vim.bo.fileformat = "unix"
-- Pressing tab during editing operations inserts 4 spaces
vim.bo.softtabstop = 4
-- Number of spaces used for each step of an (auto)indent action, e.g. '>>'.
vim.bo.shiftwidth = 4
-- Enable python highlighting
vim.g.python_highlight_all = 1

-- " Format the current document with blackdoc
-- nnoremap <silent> <Leader>bd :w<CR>:!poetry run blackdoc %<CR>:e!<CR>
vim.api.nvim_set_keymap(
  "n",
  "<Leader>bd",
  "<cmd>w<CR>:!poetry run blackdoc %<CR>:e!<CR>",
  { noremap = true, silent = true }
)

-- " Bind <Leader>f to run "ruff --fix"
vim.api.nvim_set_keymap(
  "n",
  "<Leader>f",
  "<cmd>silent call CocAction('runCommand', 'ruff.executeAutofix')<CR>",
  { noremap = true, silent = true }
)
