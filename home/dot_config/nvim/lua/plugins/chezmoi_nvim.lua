return {
  'xvzc/chezmoi.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local chezmoi = require("chezmoi")
    chezmoi.setup({
      edit = {
        watch = true,
        force = false,
      },
      notification = {
        on_open = true,
        on_apply = true,
        on_watch = false,
      },
      telescope = {
        select = { "<CR>" },
      },
    })

    FzfChezmoi = function()
      require 'fzf-lua'.fzf_exec(require("chezmoi.commands").list(), {
        actions = {
          ['default'] = function(selected, opts)
            require("chezmoi.commands").edit({
              targets = { "~/" .. selected[1] },
              args = { "--watch" }
            })
          end
        }
      })
    end
    vim.api.nvim_command('command! ChezmoiFzf lua FzfChezmoi()')
  end,
  keys = {
    { "<leader>c", function() FzfChezmoi() end },
  },
}
