return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
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
