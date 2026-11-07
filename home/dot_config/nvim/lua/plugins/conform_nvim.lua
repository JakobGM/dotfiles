local oxfmt = { "oxfmt" }

return {
  'stevearc/conform.nvim',
  name = 'conform.nvim',
  opts = {
    formatters_by_ft = {
      python = { "ruff_organize_imports", "ruff_format" },
      javascript = oxfmt,
      typescript = oxfmt,
      javascriptreact = oxfmt,
      typescriptreact = oxfmt,
      svelte = oxfmt,
      css = oxfmt,
      json = oxfmt,
      jsonc = oxfmt,
      yaml = oxfmt,
      markdown = oxfmt,
    },
    formatters = {
      -- Only format with oxfmt in projects that have an oxfmt config. Elsewhere,
      -- <leader>w falls back to the LSP formatter.
      oxfmt = { require_cwd = true },
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
