-- Gruvbox colorscheme
return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("colors")
    require("gruvbox").setup({
      contrast = "",
      dim_inactive = false,
      -- Prevent wrong background color in sign column
      -- https://github.com/ellisonleao/gruvbox.nvim/issues/230#issuecomment-1493883602
      overrides = {
        SignColumn = { link = "Normal" },
        GruvboxGreenSign = { bg = "" },
        GruvboxOrangeSign = { bg = "" },
        GruvboxPurpleSign = { bg = "" },
        GruvboxYellowSign = { bg = "" },
        GruvboxRedSign = { bg = "" },
        GruvboxBlueSign = { bg = "" },
        GruvboxAquaSign = { bg = "" },
      },
    })
    vim.cmd("colorscheme gruvbox")
    vim.opt.background = "dark"
  end,
}
