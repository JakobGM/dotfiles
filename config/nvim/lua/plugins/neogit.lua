return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "fzf-lua",
  },
  config = function()
    vim.keymap.del("n", "<CR>")
    require("neogit").setup({})
  end,
  keys = {
    {
      "<leader>gg",
      function() require("neogit").open({ kind = "vsplit" }) end,
    },
  },
}
