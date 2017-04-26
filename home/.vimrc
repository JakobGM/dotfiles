" Vundle extension manager settings [https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions]
set nocompatible              " required (and sane)
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter' " Show git diff in number column
Plugin 'blueshirts/darcula' " Darcula color scheme
Plugin 'chrisbra/Recover.vim' " Better handling of swapfiles [https://github.com/chrisbra/Recover.vim]
Plugin 'christoomey/vim-tmux-navigator' " Navigate between tmux and vim
Plugin 'ctrlpvim/ctrlp.vim' " Quick file searching
Plugin 'danro/rename.vim' " Enables :rename <new_name>
Plugin 'godlygeek/tabular'
Plugin 'jistr/vim-nerdtree-tabs' " Proper tabs for nerdtree
Plugin 'jmcantrell/vim-virtualenv' " Detection of python venv [https://github.com/jmcantrell/vim-virtualenv]
Plugin 'nvie/vim-flake8' " PEP-8 checking
Plugin 'plasticboy/vim-markdown' " Markdown syntax
Plugin 'scrooloose/nerdcommenter' " Language dependent commenter
Plugin 'scrooloose/nerdtree' " File browsing
Plugin 'scrooloose/syntastic' " Syntax checking on save
Plugin 'tmhedberg/SimpylFold'  " Better folding behaviour [Use space!]
Plugin 'tpope/vim-fugitive' " Git plugin
Plugin 'tpope/vim-surround' " Adds the surround motion bound to s
Plugin 'vim-scripts/indentpython.vim'  " Helps with python indentation
Plugin 'xuhdev/vim-latex-live-preview' " Autocompilation of TeX documents

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"" Settings from "A good .vimrc"
" Enable syntax highlighting
syntax enable

" Use colorscheme used in pycharm [https://github.com/blueshirts/darcula]
" or Solarized Dark (or Light) [https://github.com/altercation/vim-colors-solarized]
colorscheme darcula
set background=dark
"colorscheme solarized

" One tab in a file is shown as 4 spaces
set tabstop=4

" One tab inserts 4 spaces
set softtabstop=4

" Tab is replaced by the spaces specified as above
set expandtab

" Show line numbers
set number

" Show command in bottom bar
set showcmd

" Highlight line of cursor
set cursorline

" Filetype-specific line indents
filetype indent on

" Graphical menu for autocomplete
set wildmenu

" Highlight matching paranthesis
set showmatch

" Move to first occurence during search
set incsearch

" Highlight search matches
set hlsearch

" Remove highlight after finished search
nnoremap <leader><space> :nohlsearch<CR>

"" Settings for python [https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions]
" Remap vim pane switching to Ctrl-<jkhl>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with space key
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Proper indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80

" Proper indentation for Web development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Flag unnecessary whitespace in python files
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UTF-8 encoding
set encoding=utf-8

" Make space behave like other apps (delete over newlines)
set backspace=2

" Make sure the autocomplete window disappears after completion
let g:ycm_autoclose_preview_window_after_completion=1

" Remap go to definition using YouCompleteMe
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable python highlighting
let python_highlight_all=1

" Hide .pyc files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Open nerdtree with F6
map <F6> :NERDTree<CR>

" Run python scripts with F9
autocmd FileType python nnoremap <buffer> <F9> :w<cr>:exec '!clear; ipython' shellescape(@%, 1)<cr>

" Update the files more frequently (shows the gitgutter diff faster)
set updatetime=250

" Make vim powerline appear not only when split is opened
set laststatus=2

" When vim smartwraps overflowing text, the text on the new line is indented
" properly
set breakindent

" Recommended beginner settings for vim-syntastic, a syntax checker plugin
let g:syntastic_always_populate_loc_list = 1
" Uncomment line if you want the location of all errors (too noisy for bad
" programmers)
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Show relative numbers except for selected line
set relativenumber 
set number 

" Deactivate the use of the arrow keys, forcing the use of <jkhl>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

" Start scrolling when 3 lines from bottom of screen
set scrolloff=3

" When searching ignore case
set ignorecase            

" Except when using Capital letters
set smartcase

" Index more files for ctrlP fuzzy search
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_follow_symlinks=1
let g:ctrlp_show_hidden=1

" Install powerline from global package
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" LaTeX settings
" Render LaTeX document every second
autocmd Filetype tex setl updatetime=1000

" Use Preview as pdf reader
let g:livepreview_previewer = 'open -a Preview'
