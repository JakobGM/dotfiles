vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.wrap = true
vim.bo.spell = true
vim.api.nvim_create_autocmd(
  { "BufWritePost" },
  {
    pattern = "*.tex",
    callback = function()
      vim.cmd("Neomake")
    end,
  }
)
