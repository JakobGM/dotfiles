return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  opts = {
    -- Do not show a warning when there are no results,
    -- but just open the window instead.
    warn_no_results = false,
    open_no_results = true,
    win = {
      position = "right",
      size = 80,
    }
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xd",
      "<cmd>Trouble lsp_definitions toggle focus=false<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "<leader>xg",
      function() require("gitsigns").setqflist("all"); end,
      desc = "Put all git hunks in the quickfix list (Gitsigns + Trouble)",
    },
    {
      "gR",
      "<cmd>Trouble lsp_references toggle<cr>",
    },
    -- Navigate to next/previous diagnostic item across files
    {
      "<Leader>q",
      function() require("trouble").next({ skip_groups = true, jump = true }); end,
    },
    {
      "<Leader>Q",
      function() require("trouble").previous({ skip_groups = true, jump = true }); end,
    },
  }
}
