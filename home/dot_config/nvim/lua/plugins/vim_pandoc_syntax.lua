-- Syntax for pandoc supported filetypes
return {
  "vim-pandoc/vim-pandoc-syntax",
  config = function()
    -- Disable fancy mathematics rendering
    vim.g["pandoc#syntax#conceal#use"] = 0
  end,
}
