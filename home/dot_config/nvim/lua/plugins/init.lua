return {
  -- UI and Appearance
  require("plugins.dropbar_nvim"),
  require("plugins.fix_auto_scroll_nvim"),
  require("plugins.gruvbox"),
  require("plugins.lualine_nvim"),
  require("plugins.noice_nvim"),

  -- Code Analysis and Diagnostics
  require("plugins.trouble_nvim"),

  -- Syntax Highlighting and Parsing
  require("plugins.nvim_treesitter"),

  -- File Navigation, Search and Management
  require("plugins.fzf_lua"),
  require("plugins.neo_tree_nvim"),
  require("plugins.nvim_lsp_file_operations"),
  require("plugins.tagbar"),
  require("plugins.vim_gutentags"),

  -- Git Integration
  require("plugins.gitsigns_nvim"),
  require("plugins.neogit"),
  require("plugins.vim_fugitive"),

  -- Code Completion and Snippets
  require("plugins.blink_cmp"),
  require("plugins.copilot_lua"),

  -- Language Server Protocol (LSP)
  require("plugins.nvim_lspconfig"),

  -- Debugging

  -- Testing
  require("plugins.neotest"),

  -- Text Editing and Manipulation
  require("plugins.conform_nvim"),
  require("plugins.nvim_spectre"),
  require("plugins.rename"),
  require("plugins.vim_argumentative"),
  require("plugins.vim_argwrap"),
  require("plugins.vim_repeat"),
  require("plugins.vim_surround"),

  -- File Type Specific
  require("plugins.vim_caddyfile"),

  -- Utility
  require("plugins.kulala_nvim"),
  require("plugins.vim_lastplace"),
  require("plugins.vim_smooth_scroll"),

  -- Documentation and Help

  -- Terminal Integration
  require("plugins.kitty_scrollback_nvim"),

  -- Artificial Intelligence

  -- Miscellaneous
  require("plugins.lazydev_nvim"),
  require("plugins.vim_wakatime"),
}
