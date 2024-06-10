return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-python",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")
      }
    })
  end,
  keys = {
    { "gtt", function() require("neotest").run.run() end },
    { "gtf", function() require("neotest").run.run(vim.fn.expand("%")) end },
    { "gtw", function() require("neotest").watch.toggle() end },
    { "gtd", function() require("neotest").run.run({ strategy = "dap" }) end },
    { "gta", function() require("neotest").run.attach() end },
  }
}
