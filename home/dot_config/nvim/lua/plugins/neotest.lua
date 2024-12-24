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
        require("neotest-python")
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
    { "gtt", function() require("neotest").run.run() end },
    { "gtf", function() require("neotest").run.run(vim.fn.expand("%")) end },
    { "gtw", function() require("neotest").watch.toggle() end },
    { "gtd", function() require("neotest").run.run({ strategy = "dap" }) end },
    { "gta", function() require("neotest").run.attach() end },
    { "gts", function() require("neotest").output_panel.toggle() end },
  }
}
