return {
  'saghen/blink.cmp',
  enabled = true,
  dependencies = 'rafamadriz/friendly-snippets',
  event = "InsertEnter",

  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = {
        'codecompanion',
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
      providers = {
        codecompanion = {
          name = "CodeCompanion",
          module = "codecompanion.providers.completion.blink",
          enabled = true,
        },
      },
    },
    completion = {
      list = {
        selection = "auto_insert",
      },
    },
  },
  opts_extend = { "sources.default" }
}
