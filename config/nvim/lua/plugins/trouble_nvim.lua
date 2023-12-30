return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    position = "right",
    -- Do not add empty line at top of diagnostic window
    padding = false,
    -- Do not navigate to top upon reaching bottom
    cycle_results = false,
    -- Use signs defined by the LSP client
    use_diagnostic_signs = true,
  },
  keys = {
    { "<Leader>xx", "<cmd>TroubleToggle<cr>" },
    { "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
    { "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
    { "<Leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
    { "<Leader>xl", "<cmd>TroubleToggle loclist<cr>" },
    { "gR",         "<cmd>TroubleToggle lsp_references<cr>" },
  }
}
