-- Lightweight statusline without slow plugin integrations
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "ellisonleao/gruvbox.nvim",
  },
  opts = {
    options = {
      -- Single statusline across panes
      globalstatus = true,

      -- Picks gruvbox_dark or gruvbox_light from 'background', and lualine
      -- reloads it on every ColorScheme event
      theme = "gruvbox",
    },
  }
}
