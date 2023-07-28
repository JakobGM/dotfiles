-- Tree-sitter based syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  -- Equivalent of {'do': ':TSUpdate'} in vim-plug just for lazy.nvim
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
    require("nvim-treesitter.configs").setup {
      -- A list of parser names, or "all"
      ensure_installed = { "python", "rust" },

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      playground = {
        enable = true,
        disable = {},
        -- Debounced time for highlighting nodes in the playground from source code
        updatetime = 25,
        -- Whether the query persists across vim sessions
        persist_queries = false,
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    }

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.dbt = {
      install_info = {
        url = "~/dev/tree-sitter-jinja2", -- local path or git repo
        files = { "src/parser.c" },
        branch = "main",
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
      },
      filetype = "sql.jinja",                   -- if filetype does not match the parser name
    }
  end,
}
