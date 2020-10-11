" Proper indentation for python files
set fileformat=unix
set softtabstop=4  " Pressing tab during editing operations inserts 4 spaces
set shiftwidth=4  " Number of spaces used for each step of an (auto)indent action, e.g. '>>'.
let python_highlight_all=1  " Enable python highlighting

augroup PythonColorColumn
autocmd!
  " When a Python file is read or the text changes in normal or insert mode,
  " draw a column marking the maximum line length if a line exceeds this length
  autocmd BufRead,TextChanged *.py call ShowColumnIfLineTooLong(88)
augroup END

" Color the column marking the lengthLimit when the longest line in the file
" exceeds the lengthLimit
function! ShowColumnIfLineTooLong(lengthLimit)
  " See https://stackoverflow.com/questions/2075276/longest-line-in-vim#2982789
  let maxLineLength = max(map(getline(1,'$'), 'len(v:val)'))

  if maxLineLength > a:lengthLimit
    " Draw the vertical line at the first letter that exceeds the limit
    execute "set colorcolumn=" . (a:lengthLimit + 1)
  else
    set colorcolumn=""
  endif
endfunction

" Automatically execute black on write
autocmd BufWritePre *.py silent execute ':Black'
