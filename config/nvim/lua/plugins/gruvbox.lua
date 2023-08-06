-- Gruvbox colorscheme
return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("colors")
    require("gruvbox").setup({
      contrast = "",
      dim_inactive = true,
    })
    vim.cmd("colorscheme gruvbox")
    vim.opt.background = "dark"
  end,
}
