-- Use 256 colors in gui_running mode
if not vim.api.nvim_eval("has('gui_running')") then
  vim.opt.t_Co = 256
end

-- Make sure that 256 colors are used
vim.opt.termguicolors = true
