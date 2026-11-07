return {
  'stevearc/conform.nvim',
  name = 'conform.nvim',
  opts = {},
  keys = {
    {
      "<leader>w",
      function()
        require("conform").format({ async = false, lsp_format = "fallback" })
        vim.cmd("silent write")
      end,
      mode = { "n", "v" },
      { desc = "Format and save" },
    }
  },
}
