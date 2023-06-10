vim.bo.shiftwidth = 2
vim.bo.wrap = true

vim.api.nvim_set_keymap("n", "<CR>", "<Plug>RDSendLine", {})
vim.api.nvim_set_keymap("n", "<S-CR>", "<Plug>RDSendLine :normal k", {})
vim.api.nvim_set_keymap("n", "<Leader>a", "<Plug>RDSendFile", {})
