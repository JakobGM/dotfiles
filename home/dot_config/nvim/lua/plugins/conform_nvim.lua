return {
  'stevearc/conform.nvim',
  name = 'conform.nvim',
  opts = {
    formatters_by_ft = {
      javascript = { 'prettierd' },
      htmldjango = { 'prettierd' },
      css = { 'prettierd' },
      graphql = { 'prettierd' },
      html = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      json = { 'prettierd' },
      less = { 'prettierd' },
      markdown = { 'prettierd' },
      scss = { 'prettierd' },
      typescript = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      yaml = { 'prettierd' },
    },
  },
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
