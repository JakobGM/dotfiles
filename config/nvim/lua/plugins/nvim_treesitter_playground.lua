-- Annotate current buffer with tree-sitter nodes using :TSPlaygroundToggle
return {
  "nvim-treesitter/playground",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = "TSPlaygroundToggle",
}
