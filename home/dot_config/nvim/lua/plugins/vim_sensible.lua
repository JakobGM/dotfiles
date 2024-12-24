-- Sensible vim defaults
-- Stuff enabled by vim-sensible:
--  syntax enable                        -  Color highlighting
--  filetype plugin indent on            -  Filetype detection and correct indentation
--  wildmenu                             -  Show autocomplete in vim command mode
--  encoding=utf-8                       -  Encode as UTF-8
--  autoread                             -  Autoread file changes (undoable by u)
--  incsearch                            -  Start searching before pressing enter
--  <C>-L keybinding                     -  For removing search highlight
--  laststatus=2                         -  Show statusline at all times
--  scrolloff=1                          -  Always show at least one line above/below the cursor
--  load matchit.vim                     -  Jump between matching tags with %
--  backspace=2                          -  Delete over newlines, etc.
return {
  "tpope/vim-sensible",
}
