-- Gruvbox colorscheme with dark and light variants.
--
-- Neovim (0.11+) queries the terminal's background color at startup and sets
-- 'background' to match. It also enables DEC mode 2031, so kitty and ghostty
-- notify it when the system switches between light and dark mode, and it then
-- updates 'background' again. Changing 'background' reloads the colorscheme in
-- the matching variant. Do not set 'background' in this config: Neovim only
-- detects it automatically when the option has not been set explicitly.
return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      -- Matches the "Gruvbox {Dark,Light} Soft" kitty themes
      contrast = "soft",
      -- Signs and the sign column use the buffer background (bg0) instead of
      -- bg1, so the left gutter does not stand out as a separate bar
      overrides = {
        SignColumn = { bg = "NONE" },
        GruvboxRedSign = { bg = "NONE" },
        GruvboxGreenSign = { bg = "NONE" },
        GruvboxYellowSign = { bg = "NONE" },
        GruvboxBlueSign = { bg = "NONE" },
        GruvboxPurpleSign = { bg = "NONE" },
        GruvboxAquaSign = { bg = "NONE" },
        GruvboxOrangeSign = { bg = "NONE" },
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
