return {
  -- UI and Appearance
  require("plugins.gruvbox"),
  require("plugins.lualine_nvim"),
  require("plugins.barbecue_nvim"),
  require("plugins.vim_devicons"),
  require("plugins.noice_nvim"),

  -- Code Analysis and Diagnostics
  require("plugins.trouble_nvim"),
  require("plugins.nvim_coverage"),

  -- Syntax Highlighting and Parsing
  require("plugins.nvim_treesitter"),

  -- File Navigation and Search
  require("plugins.fzf_lua"),
  require("plugins.vim_tmux_navigator"),
  require("plugins.tagbar"),
  require("plugins.vim_gutentags"),
  require("plugins.neo_tree_nvim"),

  -- Git Integration
  require("plugins.git_messeger_vim"),
  require("plugins.gitsigns_nvim"),
  require("plugins.magit"),
  require("plugins.mini_diff"),
  require("plugins.neogit"),
  require("plugins.vim_fugitive"),

  -- Code Completion and Snippets
  require("plugins.nvim_cmp"),
  require("plugins.blink_cmp"),
  require("plugins.copilot_lua"),

  -- Language Server Protocol (LSP)
  require("plugins.nvim_lspconfig"),
  require("plugins.prettier_nvim"),

  -- Debugging
  require("plugins.nvim_dap"),

  -- Testing
  require("plugins.neotest"),

  -- Text Editing and Manipulation
  require("plugins.vim_surround"),
  require("plugins.vim_repeat"),
  require("plugins.vim_argumentative"),
  require("plugins.vim_argwrap"),
  require("plugins.tabular"),
  require("plugins.nvim_comment"),
  require("plugins.rename"),
  require("plugins.nvim_spectre"),

  -- File Type Specific
  require("plugins.vimtex"),
  require("plugins.render_markdown_nvim"),

  -- Utility
  require("plugins.vim_sensible"),
  require("plugins.vim_lastplace"),
  require("plugins.vim_smooth_scroll"),
  require("plugins.stable_windows"),
  require("plugins.neomake"),
  require("plugins.kulala_nvim"),

  -- Documentation and Help
  require("plugins.neoman_vim"),

  -- Terminal Integration
  require("plugins.kitty_scrollback_nvim"),

  -- Artificial Intelligence
  require("plugins.codecompanion_nvim"),

  -- Miscellaneous
  require("plugins.neodev_nvim"),
  require("plugins.vim_carbon_now_sh"),
  require("plugins.vim_wakatime"),
}
