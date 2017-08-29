" Vundle extension manager settings [https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions]
set nocompatible              " required (and sane)
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'airblade/vim-gitgutter'                                     " Show git diff in number column
Plugin 'alvan/vim-closetag'                                         " Autoclose html tags
Plugin 'blueshirts/darcula'                                         " Darcula color scheme
Plugin 'chrisbra/Recover.vim'                                       " Better handling of swapfiles [https://github.com/chrisbra/Recover.vim]
Plugin 'christoomey/vim-tmux-navigator'                             " Navigate between tmux and vim with <C>+jkhl
Plugin 'danro/rename.vim'                                           " Enables :rename <new_name>
Plugin 'davidhalter/jedi-vim'                                       " Autocompletion for python
Plugin 'editorconfig/editorconfig-vim'                              " Respect .editorconfig configurations
Plugin 'edkolev/tmuxline.vim'                                       " Colortheme for tmux powerline, using vim colorschemes
Plugin 'ervandew/supertab'                                          " Use <Tab> for autocompletion
Plugin 'fooSoft/vim-argwrap'                                        " Wrap function arguments with <leader>a
Plugin 'godlygeek/tabular'                                          " :Tab /<repexp> in order to allign
Plugin 'itchyny/lightline.vim'                                      " Lightweight statusline without slow plugin integrations
Plugin 'janko-m/vim-test'                                           " Run the entire test suite with <leader>t
Plugin 'jmcantrell/vim-virtualenv'                                  " Detection of python venv for :python and :!python
Plugin 'jreybert/vimagit'                                           " Modal git editing with <leader>g
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file++ searching
Plugin 'junegunn/fzf.vim'                                           " Asynchronous file/tags searcher
Plugin 'ludovicchabant/vim-gutentags'                               " Automatically create ctag files
Plugin 'melonmanchan/vim-tmux-resizer'                              " Resize vim/tmux panes with Alt-hjkl
Plugin 'morhetz/gruvbox'                                            " Gruvbox colorscheme
Plugin 'plasticboy/vim-markdown'                                    " Markdown syntax
Plugin 'scrooloose/nerdtree'                                        " File browsing
Plugin 'tpope/vim-commentary'                                       " Adds comment action with 'gc'
Plugin 'tpope/vim-dispatch'                                         " Run tests in tmux pane with <F12>
Plugin 'tpope/vim-fugitive'                                         " Git plugin with commands 'G<command>'
Plugin 'tpope/vim-sensible'                                         " Sensible vim defaults
Plugin 'tpope/vim-surround'                                         " Adds the surround motion bound to s
Plugin 'vimjas/vim-python-pep8-indent'                              " More PEP8 compliant python indentation

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
" colorscheme darcula
colorscheme gruvbox
set background=dark

" One tab in a file is shown as 4 spaces
set tabstop=4

" One tab inserts 4 spaces
set softtabstop=4

" One <tab> equals 4 <space> is the best standard setting
set shiftwidth=4

" Tab is replaced by the spaces specified as above
set expandtab

" Show command in bottom bar
set showcmd

" <Leader> is set to space
:let mapleader=" "

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

" Enable python highlighting
let python_highlight_all=1

" Hide .pyc files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Open nerdtree with F6
map <F6> :NERDTree<CR>

" When vim smartwraps overflowing text, the text on the new line is indented
" properly
set breakindent

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

" Move to first search occurence which matches
set incsearch

" Do not highlight search matches
set nohlsearch

" Don't let the filetype plugin insert newlines automatically
" This can be set on a filetype basis manually instead
set textwidth=0 wrapmargin=0

" Do not let vim force line breaks when exceeding textwidth in insert mode
set formatoptions-=t

" Need to set this in order to make :Limelight work with Darcula colorscheme
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Automatically enter :Limelight mode in Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Use vim-test to run test suite automagically with <leader>s
nmap <silent> <leader>s :TestSuite<CR>

" Use pytest as the preferred test framework for python files
let test#python#runner = 'pytest'

" Keybinding for python imports
map <F5>    :ImportName<CR>

" Vim-dispatch settings
nnoremap <F12> :Dispatch pytest<CR>

" Some experimenting with latency
set norelativenumber
set nocursorline
set ttyfast
set lazyredraw

" Python path for current python project, used with Jedi-vim
let g:python3_host_prog = '/Users/jakobgm/.virtualenvs/kokekunster/bin/python'

" Wrap function arguments
nnoremap <silent> <leader>a :ArgWrap<CR>

" Use trailing comma on last argument
let g:argwrap_tail_comma = 1

" Open new splits to the right and below (feels more intuitive)
set splitright
set splitbelow

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" FZF related settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" All files in project
nnoremap <silent> <leader><space> :Files<CR>

" All tags in current buffer
nnoremap <silent> <leader>T :BTags<CR>

" All tags in project
nnoremap <silent> <leader>t :Tags<CR>

" Command history
nnoremap <silent> <leader>: :History:<CR>

" All git commits
nnoremap <silent> <leader>gl :Commits<CR>

" All git commits in current buffer
nnoremap <silent> <leader>Gl :Commits<CR>

" Grep content of all files
nnoremap <silent> <leader>/ :Find<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


" Vimagit settings
nnoremap <leader>g :Magit<CR>
nnoremap <leader>p :! git push<CR>

" Neovim terminal commands
if has('nvim')
    " To map <Esc> to exit terminal-mode:
    tnoremap <Esc> <C-\><C-n>

    " To simulate |i_CTRL-R| in terminal-mode:
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

    " Window swithing like vim-tmux-navigator
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
endif

" Enable vim/tmux pane resizing with Alt-hjkl
" let g:tmux_resizer_no_mappings = 0

" Make sure that 256 colors are used
set termguicolors

" Enable deletion of untracked files in Magit
let g:magit_discard_untracked_do_delete=1
