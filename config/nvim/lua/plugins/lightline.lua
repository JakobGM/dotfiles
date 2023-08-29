-- Lightweight statusline without slow plugin integrations
return {
  "itchyny/lightline.vim",
  dependencies = {
    "majutsushi/tagbar",
  },
  config = function()
    -- Lightline settings should be placed before setting the colorscheme
    -- Settings for vim-devicons for lightline
    vim.g.lightline = {
      colorscheme = 'gruvbox',
      active = {
        left = { { 'mode', 'paste' }, { 'readonly', 'relativepath', 'percent', 'modified' } },
        right = { {}, { 'filetype' }, { 'tagbar' } },
      },
      component_function = {
        filetype = 'MyFiletype',
        fileformat = 'MyFileformat',
        gitbranch = 'FugitiveHead',
        bufferinfo = 'lightline#buffer#bufferinfo',
      },
      tab = {
        active = { 'filename', 'modified' },
        inactive = { 'filename', 'modified' },
      },
      tabline = {
        left = { { 'tabs' } },
        right = { { 'gitbranch' } },
      },
      component_expand = {
        buffercurrent = 'lightline#buffer#buffercurrent',
        bufferbefore = 'lightline#buffer#bufferbefore',
        bufferafter = 'lightline#buffer#bufferafter',
      },
      component_type = {
        buffercurrent = 'tabsel',
        bufferbefore = 'raw',
        bufferafter = 'raw',
      },
      component = {
        separator = '',
        tagbar = '%{tagbar#currenttag("%s", "", "f")}',
      },
    }

    vim.api.nvim_command([[
        function! MyFiletype() abort
          return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
        endfunction

        function! MyFileformat() abort
          return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
        endfunction
    ]])

    -- Use auocmd to force lightline update when coc.nvim status changes.
    vim.api.nvim_command("autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()")
  end
}
