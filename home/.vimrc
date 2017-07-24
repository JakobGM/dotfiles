" Vundle extension manager settings [https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions]
set nocompatible              " required (and sane)
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'alvan/vim-closetag'             " Autoclose html tags
Plugin 'airblade/vim-gitgutter'         " Show git diff in number column
Plugin 'blueshirts/darcula'             " Darcula color scheme
Plugin 'bogado/file-line'               " Open files at a specific line number (vim filename:42)
Plugin 'chrisbra/Recover.vim'           " Better handling of swapfiles [https://github.com/chrisbra/Recover.vim]
Plugin 'christoomey/vim-tmux-navigator' " Navigate between tmux and vim with <C>+jkhl
Plugin 'ctrlpvim/ctrlp.vim'             " Quick fuzzy file searching
Plugin 'danro/rename.vim'               " Enables :rename <new_name>
Plugin 'davidhalter/jedi-vim'           " Autocompletion for python
Plugin 'editorconfig/editorconfig-vim'  " Respect .editorconfig configurations
Plugin 'godlygeek/tabular'              " :Tab /<repexp> in order to allign
Plugin 'janko-m/vim-test'				" Run the entire test suite with <leader>t
Plugin 'jistr/vim-nerdtree-tabs'        " A bit more consistent NERDTree behaviour
Plugin 'jmcantrell/vim-virtualenv'      " Detection of python venv for :python and :!python [https://github.com/jmcantrell/vim-virtualenv]
Plugin 'junegunn/goyo.vim'              " Distraction free editing with :Goyo
Plugin 'junegunn/limelight.vim'         " Make cursor-focused paragraph the only colored text
Plugin 'plasticboy/vim-markdown'        " Markdown syntax
Plugin 'scrooloose/nerdtree'            " File browsing
Plugin 'scrooloose/syntastic'           " Syntax checking on save
Plugin 'tmhedberg/SimpylFold'           " Better folding behaviour [Use space!]
Plugin 'tpope/vim-commentary'           " Adds comment action with 'gc'
Plugin 'tpope/vim-fugitive'             " Git plugin with commands 'G<command>'
Plugin 'tpope/vim-sensible'             " Sensible vim defaults
Plugin 'tpope/vim-surround'             " Adds the surround motion bound to s

" Unused at the moment
" Plugin 'python-mode/python-mode'        " Lots of different python plugins and functionality

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Stuff enabled by vim-sensible:
"  syntax enable                        -  Color highlighting
"  filetype plugin indent on            -  Filetype detection and correct indentation
"  wildmenu                             -  Show autocomplete in vim command mode
"  encoding=utf-8                       -  Encode as UTF-8
"  autoread                             -  Autoread file changes (undoable by u)
"  incsearch                            -  Start searching before pressing enter
"  <C>-L keybinding                     -  For removing search highlight
"  laststatus=2                         -  Show statusline at all times
"  scrolloff=1                          -  Always show at least one line above/below the cursor
"  load matchit.vim                     -  Jump between matching tags with %
"  backspace=2                          -  Delete over newlines, etc.

"" Settings from 'A good .vimrc'
" Use colorscheme used in pycharm [https://github.com/blueshirts/darcula]
" or Solarized Dark (or Light) [https://github.com/altercation/vim-colors-solarized]
colorscheme darcula
set background=dark

" One tab in a file is shown as 4 spaces
set tabstop=4

" One tab inserts 4 spaces
set softtabstop=4

" Tab is replaced by the spaces specified as above
set expandtab

" Show relative line numbers except for the current line
set relativenumber
set number

" Show command in bottom bar
set showcmd

" Highlight line of cursor
set cursorline

" Highlight matching paranthesis
set showmatch

" Highlight search matches
set hlsearch

"" Settings for python [https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions]
" Enable folding with space key
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Proper indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
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

" Make sure the autocomplete window disappears after completion
" let g:ycm_autoclose_preview_window_after_completion=1

" Remap go to definition using YouCompleteMe
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable python highlighting
let python_highlight_all=1

" Reccomended settings for Django and YCM found here:
" https://code.djangoproject.com/wiki/UsingVimWithDjango
" let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1             " Default 1, just ensure
" let g:ycm_seed_identifiers_with_syntax = 1        " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1                " Completion in comments
" let g:ycm_complete_in_strings = 1                 " Completion in string

" Hide .pyc files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Open nerdtree with F6
map <F6> :NERDTree<CR>

" Run python scripts with F9
autocmd FileType python nnoremap <buffer> <F9> :w<cr>:exec '!clear; ipython' shellescape(@%, 1)<cr>

" Update the files more frequently (shows the gitgutter diff faster)
set updatetime=250

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

" Set linters for python files
let g:syntastic_python_checkers = ['mypy', 'flake8']

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

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

" Don't let the filetype plugin insert newlines automatically
" This can be set on a filetype basis manually instead
set textwidth=0

nnoremap <leader><space> :nohlsearch<CR>

" One <tab> equals 4 <space> is the best standard setting
set shiftwidth=4

" Set python 3 as standard for python-mode plugin
let g:pymode_python = 'python3'

" Don't automatically open linting error window in python-mode
let g:pymode_lint_cwindow = 0

" Need to set this in order to make :Limelight work with Darcula colorscheme
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Automatically enter :Limelight mode in Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Use vim-test to run test suite automagically with <leader>t
nmap <silent> <leader>t :TestSuite<CR>

" Use Django as python test runner (for now)
let test#python#runner = 'djangotest'
