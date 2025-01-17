return {
  "nvim-neo-tree/neo-tree.nvim",
  name = "neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
  keys = {
    { "<Leader>n", ":Neotree toggle<CR>", mode = { "n" } },
  },
}
