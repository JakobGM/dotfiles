return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter",
    "render-markdown.nvim",
    "mini.diff",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
        roles = {
          llm = "CodeCompanion",
          user = "JakobGM",
        },
        slash_commands = {
          buffer = { opts = { provider = "fzf_lua" } },
          fetch = {},
          file = { opts = { provider = "fzf_lua" } },
          help = { opts = { provider = "fzf_lua" } },
          symbols = { opts = { provider = "fzf_lua" } },
        },
        keymaps = {
          close = {
            modes = {
              n = "q",
            },
            index = 3,
            callback = "keymaps.close",
            description = "Close Chat",
          },
          stop = {
            modes = {
              n = "<C-c",
            },
            index = 4,
            callback = "keymaps.stop",
            description = "Stop Request",
          },
        },
      },
    },
    display = {
      diff = {
        provider = "mini_diff",
      },
    },
    inline = {
      adapter = "anthropic",
    },
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:op --account=crdbrd read 'op://vesk7mrpebygjjb4yzyo7wvzwa/jpjeiuo2rngait7lqasyqqswu4/credential' --no-newline",
          },
        })
      end,
      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key =
            "cmd:op --account=crdbrd read 'op://vesk7mrpebygjjb4yzyo7wvzwa/up54ftsb5dpovvttkijlx2k7cq/api-key' --no-newline",
          },
        })
      end,
    },
  },
  keys = {
    { "<C-g>c", "<cmd>CodeCompanionChat<CR>",        mode = { "n", "v" } },
    { "<C-g>g", "<cmd>CodeCompanionChat Toggle<CR>", mode = { "n", "v" } },
    { "<C-g>i", "<cmd>CodeCompanion<CR>",            mode = { "n", "v" } },
    { "<C-g>a", "<cmd>CodeCompanionActions<CR>",     mode = { "n", "v" } },
  },
  init = function()
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
