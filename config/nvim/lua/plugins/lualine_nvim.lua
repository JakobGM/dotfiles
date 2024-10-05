-- Lightweight statusline without slow plugin integrations
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "luisiacc/gruvbox-baby",
  },
  opts = {
    options = {
      -- Single statusline across panes
      globalstatus = true,

      theme = "gruvbox-baby",
    },
  }
}
