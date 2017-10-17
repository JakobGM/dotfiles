" Vundle extension manager settings [https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/#vim-extensions]
set nocompatible              " required (and sane)
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'                                           " Show git diff in number column
Plug 'alfredodeza/pytest.vim'                                           " :Pytest class/method/function/file/project
Plug 'alvan/vim-closetag'                                               " Autoclose html tags
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' } " Language server protocol support for neovim
Plug 'chrisbra/Recover.vim'                                             " Better handling of swapfiles [https://github.com/chrisbra/Recover.vim]
Plug 'christoomey/vim-tmux-navigator'                                   " Navigate between tmux and vim with <C>+jkhl
Plug 'danro/rename.vim'                                                 " Enables :rename <new_name>
Plug 'editorconfig/editorconfig-vim'                                    " Respect .editorconfig configurations
Plug 'edkolev/tmuxline.vim'                                             " Colortheme for tmux powerline, using vim colorschemes
Plug 'ervandew/supertab'                                                " Use <Tab> for autocompletion
Plug 'fooSoft/vim-argwrap'                                              " Wrap function arguments with <leader>a
Plug 'godlygeek/tabular'                                                " :Tab /<repexp> in order to allign
Plug 'itchyny/lightline.vim'                                            " Lightweight statusline without slow plugin integrations
Plug 'jalvesaq/Nvim-R'                                                  " Plugin for all R-lang related functionality
Plug 'jmcantrell/vim-virtualenv'                                        " Detection of python venv for :python and :!python
Plug 'jreybert/vimagit'                                                 " Modal git editing with <leader>g
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }       " Fuzzy file++ searching
Plug 'junegunn/fzf.vim'                                                 " Asynchronous file/tags searcher
Plug 'justinmk/vim-sneak'                                               " Move to 2 character combinations with sXY, and navigate with ; and ,
Plug 'ludovicchabant/vim-gutentags'                                     " Automatically create ctag files
Plug 'majutsushi/tagbar'                                                " Browse/display CTags
Plug 'melonmanchan/vim-tmux-resizer'                                    " Resize vim/tmux panes with Alt-hjkl
Plug 'mhinz/vim-startify'                                               " Start screen for vim
Plug 'morhetz/gruvbox'                                                  " Gruvbox colorscheme
Plug 'neomake/neomake', { 'for': ['python', 'javascript'] }             " Asynchronous linting and compiling
Plug 'plasticboy/vim-markdown'                                          " Markdown syntax
Plug 'ryanoasis/vim-devicons'                                           " For file icons in lots of plugins
Plug 'scrooloose/nerdtree'                                              " File browsing
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }           " AutoComplete for NeoVim
Plug 'shougo/echodoc.vim'                                               " Showing function signature and inline doc
Plug 'tpope/vim-commentary'                                             " Adds comment action with 'gc'
Plug 'tpope/vim-fugitive'                                               " Git plugin with commands 'G<command>'
Plug 'tpope/vim-obsession'                                              " Record/save editor instances with :Obsess
Plug 'tpope/vim-repeat'                                                 " Add repeat support with '.' for lots of plugins
Plug 'tpope/vim-sensible'                                               " Sensible vim defaults
Plug 'tpope/vim-surround'                                               " Adds the surround motion bound to s
Plug 'vimjas/vim-python-pep8-indent'                                    " More PEP8 compliant python indentation
Plug 'w0rp/ale', { 'for': ['r', 'rmd'] }                                " Neomake does not support Lintr
Plug 'wakatime/vim-wakatime'                                            " Automatic timetracking of programming [wakatime.com]
Plug 'wincent/scalpel'                                                  " Use :Scalpel to rename variables

call plug#end()

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

" And use "," as the local leader key
let maplocalleader = ","

" Proper indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set formatexpr=LanguageClient_textDocument_rangeFormatting()


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

" Some experimenting with latency
set norelativenumber
set ttyfast
set lazyredraw

" Costy settings
set cursorline

" Python path for current python project, used with Jedi-vim
let g:python3_host_prog = '/Users/jakobgm/.virtualenvs/NeoVim3/bin/python'

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
nnoremap <leader>gg :Magit<CR>
nnoremap <leader>gp :! git push<CR>

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

" iTerm2 Esc+ mode for the alt/meta key prevents insertion of Norwegian characters on english keyboards.
" Normal meta key mode disables keybinding of <M-whatever>. The solution is binding <M-eoa> to æøå instead.
inoremap <M-e> æ
inoremap <M-o> ø
inoremap <M-a> å

" Use deoplete (AutoComplete for NeoVim)
if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

" Run Neomake every time the current file is saved
if has('neomake')
  autocmd! BufWritePost * Neomake
endif

" Settings for vim-devicons for lightline
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Open Tagbar CTags with <F8>
nmap <F8> :TagbarToggle<CR>

" Always open TagBar in supported files
autocmd FileType * nested :call tagbar#autoopen(0)

" Do *not* replace _ with -> in R filetype
let R_assign = 0

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterUndoHunk

" Pytest mappings
nmap <silent><LocalLeader>tf <Esc>:Pytest file<CR>
nmap <silent><LocalLeader>tc <Esc>:Pytest class<CR>
nmap <silent><LocalLeader>tm <Esc>:Pytest method<CR>
nmap <silent><LocalLeader>tp <Esc>:Pytest project<CR>

" Write to file
nmap <Leader>w <Esc>:w<CR>

"" Language server protocol settings
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'python' : ['pyls']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <LocalLeader>K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <LocalLeader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <LocalLeader>r :call LanguageClient_textDocument_rename()<CR>

" Use 256 colors in gui_running mode
if !has('gui_running')
  set t_Co=256
endif
