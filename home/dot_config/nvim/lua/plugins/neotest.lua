return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-python",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          args = { "--create-db" },
        })
      },
      output = {
        enabled = true,
        open_on_run = false,
      },
      output_panel = {
        enabled = true,
        open = 'botright vsplit | vertical resize 80',
      },
    })
  end,
  keys = {
    {
      "gtt",
      function() require("neotest").run.run() end,
      desc = "Run closed test",
    },
    {
      "gtf",
      function() require("neotest").run.run(vim.fn.expand("%")) end,
      desc = "Run test file"
    },
    {
      "gtw",
      function() require("neotest").watch.toggle() end,

      desc = "Re-run tests on file change"
    },
    {
      "gtd",
      function() require("neotest").run.run({ strategy = "dap" }) end,
      desc = "Run test with debugger",
    },
    {
      "gta",
      function() require("neotest").run.attach() end,
      desc = "Attach to test"

    },
    {
      "gts",
      function() require("neotest").output_panel.toggle() end,
      desc = "Toggle test output panel",
    },
  }
}
