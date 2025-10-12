return {
  -- UI and Appearance
  require("plugins.barbecue_nvim"),
  require("plugins.fix_auto_scroll_nvim"),
  require("plugins.gruvbox"),
  require("plugins.lualine_nvim"),
  require("plugins.noice_nvim"),
  require("plugins.vim_devicons"),
  require("plugins.image_nvim"),

  -- Code Analysis and Diagnostics
  require("plugins.nvim_coverage"),
  require("plugins.trouble_nvim"),

  -- Syntax Highlighting and Parsing
  require("plugins.nvim_treesitter"),

  -- File Navigation, Search and Management
  require("plugins.fzf_lua"),
  require("plugins.neo_tree_nvim"),
  require("plugins.nvim_lsp_file_operations"),
  require("plugins.tagbar"),
  require("plugins.vim_gutentags"),
  require("plugins.vim_tmux_navigator"),

  -- Git Integration
  require("plugins.gitsigns_nvim"),
  require("plugins.magit"),
  require("plugins.mini_diff"),
  require("plugins.neogit"),
  require("plugins.vim_fugitive"),

  -- Code Completion and Snippets
  require("plugins.blink_cmp"),
  require("plugins.copilot_lua"),
  require("plugins.nvim_cmp"),

  -- Language Server Protocol (LSP)
  require("plugins.nvim_lspconfig"),

  -- Debugging
  require("plugins.nvim_dap"),

  -- Testing
  require("plugins.neotest"),

  -- Text Editing and Manipulation
  require("plugins.conform_nvim"),
  require("plugins.nvim_comment"),
  require("plugins.nvim_spectre"),
  require("plugins.rename"),
  require("plugins.tabular"),
  require("plugins.vim_argumentative"),
  require("plugins.vim_argwrap"),
  require("plugins.vim_repeat"),
  require("plugins.vim_surround"),

  -- File Type Specific
  require("plugins.molten_nvim"),
  require("plugins.render_markdown_nvim"),
  require("plugins.vim_caddyfile"),
  require("plugins.vim_dadbod_ui"),
  require("plugins.vimtex"),

  -- Utility
  require("plugins.kulala_nvim"),
  require("plugins.neomake"),
  require("plugins.vim_lastplace"),
  require("plugins.vim_sensible"),
  require("plugins.vim_smooth_scroll"),

  -- Documentation and Help
  require("plugins.neoman_vim"),

  -- Terminal Integration
  require("plugins.kitty_scrollback_nvim"),

  -- Artificial Intelligence
  require("plugins.codecompanion_nvim"),

  -- Miscellaneous
  require("plugins.lazydev_nvim"),
  require("plugins.vim_carbon_now_sh"),
  require("plugins.vim_wakatime"),
}
