-- Asynchronous file/tags searcher
return {
  "ibhagwan/fzf-lua",
  name = "fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    vim.g.fzf_action = {
      ["ctrl-s"] = "split",
      ["ctrl-v"] = "vsplit",
    }
    -- [Buffers] Jump to the existing window if possible
    vim.g.fzf_buffers_jump = 1

    require("fzf-lua").setup({
      "default-title",
      defaults = {
        formatter = "path.filename_first",
        multiline = 1,
      },
      colorscheme = "gruvbox",
      winopts = {
        fullscreen = true,
        preview = {
          default = "bat",
        },
      },
      keymap = {
        fzf = {
          -- Select all items
          ["ctrl-a"] = "toggle-all",
          -- Clear selection
          ["ctrl-u"] = "clear-query",
          -- Toggle preview
          ["ctrl-p"] = "toggle-preview",
        },
      },
    })

    local config = require("fzf-lua.config")
    local actions = require("trouble.sources.fzf").actions
    config.defaults.actions.files["ctrl-t"] = actions.open
  end,

  keys = {
    -- All files in project
    -- Replaced by fff.nvim during a testing period
    -- { "<leader><space>", function() require("fzf-lua").files() end },
    -- All tags in current buffer
    { "<leader>T",       function() require("fzf-lua").btags() end },
    -- All tags in project
    { "<leader>t",       function() require("fzf-lua").tags() end },
    -- Command
    { "<leader>:",       function() require("fzf-lua").commands() end },
    -- All git commits
    { "<leader>gl",      function() require("fzf-lua").git_commits() end },
    -- All git commits in current buffer
    { "<leader>gL",      function() require("fzf-lua").git_bcommits() end },
    -- Grep content of all files
    { "<leader>/",       function() require("fzf-lua").live_grep() end },
    -- Search normal mode mappings
    { "<leader><Esc>",   function() require("fzf-lua").keymaps() end },
    -- Search helptags
    { "<leader>hh",      function() require("fzf-lua").help_tags() end },
    -- LSP commands
    { "<leader>d",       function() require('fzf-lua').lsp_definitions() end },
    { "gr",              function() require('fzf-lua').lsp_references() end },
  },
  cmd = "FzfLua",
}
