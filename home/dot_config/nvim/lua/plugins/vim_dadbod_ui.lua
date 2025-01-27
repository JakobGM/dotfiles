return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    {
      'tpope/vim-dadbod',
      lazy = true,
    },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql' },
      lazy = true,
    },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.dbs = {
      { name = 'hub', url = 'postgres://hub:hub@localhost:5433/hub' },
    }

    local dbui_group = vim.api.nvim_create_augroup('DBUI', { clear = true })
    vim.api.nvim_create_autocmd(
      'FileType',
      {
        pattern = 'dbui',
        group = dbui_group,
        command = 'setlocal shiftwidth=2',
      }
    )
  end,
}
