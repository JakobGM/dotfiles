vim.bo.textwidth = 80
vim.bo.colorcolumn = 80
vim.bo.shiftwidth = 4

vim.bo.makeprg =
"snowsql --abort-detached-query -o header=true -o timing=false -o friendly=false -o output_format=csv --filename='"
vim.api.nvim_create_autocmd(
  { "BufEnter" },
  {
    pattern = "*.sql",
    callback = function()
      vim.bo.filetype = "sql.jinja"
    end,
    clear = true,
  }
)
