" INFO: Show all content hidden by the folds by pressing zR

""" Plugins
filetype off                  " required

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

" Git
Plug 'airblade/vim-gitgutter'                                           " Show git diff in number column
Plug 'jreybert/vimagit'                                                 " Modal git editing with <leader>g
Plug 'tpope/vim-fugitive'                                               " Git plugin with commands 'G<command>'

" Python
Plug 'alfredodeza/coveragepy.vim'                                       " Show coverage status in gutter
Plug 'alfredodeza/pytest.vim'                                           " Run py.test with :Pytest
Plug 'python-mode/python-mode', { 'branch': 'develop' }                 " Python IDE functionality
Plug 'vim-python/python-syntax'                                         " Better syntax highlighting for python
Plug 'vimjas/vim-python-pep8-indent'                                    " More PEP8 compliant python indentation
Plug 'zchee/deoplete-jedi'                                              " Use jedi as completion source for deoplete

" Navigation
Plug 'christoomey/vim-tmux-navigator'                                   " Navigate between tmux and vim with <C>+jkhl
Plug 'cskeeters/vim-smooth-scroll'                                      " Smooth scroll animation instead of jump
Plug 'farmergreg/vim-lastplace'                                         " Move cursor to last edit location when reopening files
Plug 'francoiscabrol/ranger.vim'                                        " Use ranger as file explorer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }       " Fuzzy file++ searching
Plug 'junegunn/fzf.vim'                                                 " Asynchronous file/tags searcher
Plug 'justinmk/vim-sneak'                                               " Two letter search with s{char}{char} and motions with {action}z{char}{char}, and navigate with ; and ,
Plug 'rbgrouleff/bclose.vim'                                            " Dependency of ranger.vim
Plug 'tpope/vim-rhubarb'                                                " Open GitHub source with :Gbrowse and autocompletion for GitHub issues

" Editing
Plug 'danro/rename.vim'                                                 " Enables :rename <new_name>
Plug 'fooSoft/vim-argwrap'                                              " Wrap function arguments with <leader>a
Plug 'godlygeek/tabular'                                                " :Tab /<repexp> in order to allign
Plug 'matze/vim-move'                                                   " Move selection up and down with <A-k|j>
Plug 'tpope/vim-commentary'                                             " Adds comment action with 'gc'
Plug 'tpope/vim-surround'                                               " Adds the surround motion bound to s

" Visual
Plug 'elzr/vim-json'                                                    " Better syntax highlighting for JSON files
Plug 'haya14busa/is.vim'                                                " Remove highlighting after search and toggl searches with <Ctrl>jk
Plug 'itchyny/lightline.vim'                                            " Lightweight statusline without slow plugin integrations
Plug 'jakobgm/lightline-gruvbox.vim', { 'branch': 'patch-1' }           " Gruvbox theme for the lightline statusline
Plug 'majutsushi/tagbar'                                                " Open tag navigation split with :Tagbar
Plug 'morhetz/gruvbox'                                                  " Gruvbox colorscheme
Plug 'ryanoasis/vim-devicons'                                           " For file icons in lots of plugins
Plug 'sheerun/vim-polyglot'                                             " Add syntax highlighting for a large range of filetypes
Plug 'shougo/echodoc.vim'                                               " Show function signature help
Plug 'taohex/lightline-buffer'                                          " Buffer-bar plugin for lightline

" Behaviour/tools
Plug 'kassio/neoterm'                                                   " Terminal buffer wrapper
Plug 'ludovicchabant/vim-gutentags'                                     " Automatically create ctag files
Plug 'nhooyr/neoman.vim'                                                " Using vim as a manpager
Plug 'romainl/vim-qf'                                                   " Automatically close quickfix windows that become orphaned
Plug 'tpope/vim-repeat'                                                 " Add repeat support with '.' for lots of plugins
Plug 'tpope/vim-sensible'                                               " Sensible vim defaults
Plug 'wakatime/vim-wakatime'                                            " Automatic timetracking of programming [wakatime.com]

" Deoplete completion engine needs additional support plugins when not using NeoVim
if has('nvim')
  Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Implementation of the Language Server Protocol for (Neo)vim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


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

""" Statusline

" Lightline settings should be placed before setting the colorscheme
" Settings for vim-devicons for lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'virtualenv', 'relativepath', 'modified', 'search_status'],
      \              [ 'gutentags', 'tagbar'],
      \            ],
      \   'right': [ [ ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \   },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'gitbranch': 'fugitive#head',
	  \   'search_status': 'anzu#search_status',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \   'virtualenv': 'virtualenv#statusline',
      \   'gutentags': 'gutentags#statusline',
      \ },
      \ 'tabline': {
      \   'left': [ [ 'bufferinfo' ],
      \             [ 'separator' ],
      \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \   'right': [ [ 'close' ], ],
      \ },
      \ 'component_expand': {
      \   'buffercurrent': 'lightline#buffer#buffercurrent',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \ },
      \ 'component_type': {
      \   'buffercurrent': 'tabsel',
      \   'bufferbefore': 'raw',
      \   'bufferafter': 'raw',
      \ },
      \ 'component': {
      \   'separator': '',
      \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
      \ },
      \ }

function! MyFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat() abort
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction


"""" lightline-buffer
set showtabline=2  " always show tabline

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = ''
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20


""" Colors

" Custom highlighting
function! MyHighlights() abort
    " Define BadWhitespace before using in a match
    highlight BadWhitespace ctermbg=red guibg=darkred

    " Highlight spelling mistakes in red
    highlight SpellBad cterm=underline ctermfg=red guifg=red

    " Do not use separate background color in sign column
    let g:gitgutter_override_sign_column_highlight = 1
    highlight SignColumn guibg=bg
    highlight SignColumn ctermbg=bg

    " Use underlined, bold, green for current tag
    highlight TagbarHighlight guifg=#b8bb26
    highlight TagbarHighlight gui=bold,underline

    " Highlight search results in bold green
    highlight Search guibg=guibg guifg=#b8bb26 gui=bold,underline cterm=bold,underline
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme gruvbox
set background=dark

" Use 256 colors in gui_running mode
if !has('gui_running')
  set t_Co=256
endif

" Make sure that 256 colors are used
set termguicolors


""" Formatting

" Display \t as 8 visual spaces (recommended setting)
set tabstop=8

" Pressing tab during editing operations inserts 4 spaces
set softtabstop=4

" Number of spaces used for each step of an (auto)indent action, e.g. '>>'.
set shiftwidth=4

" Tab is replaced by the spaces specified as above
set expandtab

" When vim smartwraps overflowing text, the text on the new line is indented properly
set breakindent

" Don't let the filetype plugin insert newlines automatically
set textwidth=0 wrapmargin=0

" Do not let vim force line breaks when exceeding textwidth in insert mode
set formatoptions-=t


""" Keybindings

" <Leader> is set to space
let mapleader=" "

" And use ',' as the local leader key
let maplocalleader = ","

" iTerm2 Esc+ mode for the alt/meta key prevents insertion of Norwegian characters on english keyboards.
" Normal meta key mode disables keybinding of <M-whatever>. The solution is binding <M-eoa> to æøå instead.
inoremap <M-e> æ
inoremap <M-o> ø
inoremap <M-a> å

" Write to file
nnoremap <Leader>w <Esc>:w<CR>

" Quit file
nnoremap <Leader>q <Esc>:q<CR>

" Make Y yank the rest of the line, as you would expect it to
nnoremap Y y$

" Remap arrow keys to buffer switching
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" Press <Leader>bg in order to toggle light/dark background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Keybinding for visiting the GitHub page of the plugin defined on the current line
augroup Vimrc
    autocmd!
    autocmd FileType vim nnoremap <silent> gp :call OpenPluginHomepage()<CR>
augroup END

function! OpenPluginHomepage() abort
  " Get line under cursor
  let line = getline(".")

  " Matches for instance Plug 'tpope/surround' -> tpope/surround
  " Greedy match in order to not capture trailing comments
  let plugin_name = '\w\+ \([''"]\)\(.\{-}\)\1'
  let repository = matchlist(line, plugin_name)[2]

  " Open the corresponding GitHub homepage with $BROWSER
  " You need to set the BROWSER environment variable in order for this to work
  " For MacOS, you can set the following for opening it in your default
  " browser: 'export BROWSER=open'
  silent exec "!$BROWSER https://github.com/".repository
endfunction

" Open and close folds with Enter
nnoremap <expr> <cr>   foldlevel(line('.'))  ? "za" : "\<cr>"

" Source vimrc config file
nnoremap gsv :so $MYVIMRC<CR>

" Clear search highlighting
nnoremap <Esc><Esc> :noh<CR> <Plug>(anzu-clear-search-status)

" Make use of backspace in normal mode
nnoremap <silent> <backspace> X

" Bind g(q|Q) to next item in quickfix list
" Mnemonic: "go quickfix"
nnoremap <silent> gq :cn<CR>
nnoremap <silent> gQ :cp<CR>

" Bind g(l|L) to next item in location list
" Mnemonic: "go location"
nnoremap <silent> gl :ll<CR>
nnoremap <silent> gL :ll<CR>

" Redraw syntax highlighting when color disappears
" Mnemonic: "go source syntax"
nnoremap gss :syntax sync fromstart<CR>

" Open vertical split with Space + v
nnoremap <silent> <Leader>v :vsplit<CR>


""" Commands
" Write to the current file as sudo
cmap w!! w !sudo tee > /dev/null %


""" Python

" Proper indentation for python files
au BufNewFile,BufRead *.py
    \ set fileformat=unix |
    \ set colorcolumn=80 |

" Flag unnecessary whitespace in python files
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable python highlighting
let python_highlight_all=1

" Python path for current python project, used with Jedi-vim
let g:python3_host_prog = $HOME.'/.virtualenvs/NeoVim3/bin/python'
let g:python2_host_prog = $HOME.'/.virtualenvs/NeoVim2/bin/python'


""" Visual

" Start scrolling when 7 lines from bottom of screen
set scrolloff=7

" Do not need to show -- Insert --, as lightline handles it already
set noshowmode

" Relative line numbering
set number
set relativenumber

" Do not show command in bottom bar
set noshowcmd

" Highlight current line
set cursorline

" Hide fold numbering in left column
set foldcolumn=0

" Do not wrap text at the end of the screen
set nowrap

" Disable line numbering in terminal buffer
au TermOpen * setlocal nonumber norelativenumber

" Show live substitution results when using :s
set inccommand=nosplit

" Hide cursorline in inactive window 
augroup CrossHair
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup end

" Show directory hierarchy in netrw
let g:netrw_liststyle = 3

" Remove directory banner in netrw
let g:netrw_banner = 0

" Prevent duplicate netrw buffers (bug caused by vinegar)
" See: https://codeyarns.com/2015/02/02/cannot-close-buffer-of-netrw-in-vim/
autocmd FileType netrw setl bufhidden=wipe

" Automatically place help buffer in vertical split layout
au BufEnter */doc/* if &filetype=='help' | wincmd L | endif


""" Searching

" When searching ignore case
set ignorecase            

" Except when using Capital letters
set smartcase

" Move to first search occurence which matches
set incsearch

" Highlight search matches
set hlsearch


""" Performance

" Some experimenting with latency

" Only used in vim
set ttyfast

" Do not redraw screens during macros, etc.
set lazyredraw

""" Behaviour

" Open new splits to the right and below (feels more natural)
set splitright
set splitbelow

" Maintain undo history between sessions
set undofile
set undodir=$XDG_CONFIG_HOME/nvim/undodir

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

" Required for operations modifying multiple buffers like rename (used by nLSP)
set hidden

" Turn Vim swapfile off
set noswapfile

" Save valid words to file (used with :set spell)
set spellfile=$XDG_CONFIG_HOME/nvim/spell/en.utf-8.add

" If nvim is opened within :terminal buffer, use existing nvim instance by using neovim-remote
" See $DOTREPO/python/user_requirements.txt
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

" Copy to system clipboard
vnoremap  <leader>y  "*y
vnoremap  <leader>Y  "*yg_
nnoremap  <leader>y  "*y
nnoremap  <leader>yy  "*yy

" Paste from system clipboard
nnoremap <leader>p :set paste<CR> "*p :set nopaste<CR>
nnoremap <leader>P :set paste<CR> "*P :set nopaste<CR>
vnoremap <leader>p :set paste<CR> "*p :set nopaste<CR>
vnoremap <leader>P :set paste<CR> "*P :set nopaste<CR>

" Fix common typing mistakes
iabbrev vuale value
iabbrev vaule value

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Do not show preview window when completing items
set completeopt-=preview

" Enable spellchecking in natural language files
augroup NaturalLanguage
    autocmd!
    autocmd BufRead,BufNewFile *.md,*.rst,*.txt setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

" Use word completion when spelling is enabled
set complete+=kspell

" Open right vertical help window
cnoreabbrev H vert bo h


""" Plugin settings

"""" ArgWrap
" Wrap function arguments
nnoremap <silent> <leader>a :ArgWrap<CR>

" Use trailing comma on last argument
let g:argwrap_tail_comma = 1

"""" fzf
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

" Command
nnoremap <silent> <leader>: :Commands<CR>

" All git commits
nnoremap <silent> <leader>gl :Commits<CR>

" All git commits in current buffer
nnoremap <silent> <leader>gL :Commits<CR>

" Grep content of all files
nnoremap <silent> <leader>/ :Find<CR>

" Search normal mode mappings
nnoremap <silent> <leader><Esc> :Maps<CR>

" Search helptags
nnoremap <silent> <leader>h :Helptags<CR>

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
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"""" Vimagit
nnoremap <leader>gg :Magit<CR>
nnoremap <leader>gp :! git push<CR>

" Enable deletion of untracked files in Magit
let g:magit_discard_untracked_do_delete=1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --exclude=@.gitignore --exclude=.mypy_cache'


"""" Deoplete
" Use deoplete autocompletion manager
" Disabled while waiting for this issue to be resolved:
" https://github.com/python-mode/python-mode/issues/748
" Actually, this has now been enabled as I now use
" deoplete-jedi, until this issue gets resolved
let g:deoplete#enable_at_startup = 1

" Use smartcase.
call deoplete#custom#option('smart_case', v:true)

" Do not show completion numbers in cmdline
set shortmess+=c

" Always prefer jedi completion
call deoplete#custom#source('jedi', 'rank', 9999)

" Set completion sources for specific filetypes
call deoplete#custom#option('ignore_sources', {
        \ 'python': ['LanguageClient', 'tag'],
        \})

call deoplete#custom#option('sources', {
        \ 'python': ['jedi'],
        \})

" Undo completion with backspace
inoremap <expr><BS>
\ deoplete#smart_close_popup()."\<C-h>"


"""" vim-gitgutter
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk
nmap <Leader>gN <Plug>GitGutterPrevHunk
nmap <C-n> <Plug>GitGutterNextHunk
nmap <C-p> <Plug>GitGutterPrevHunk

" Update sign column every quarter second
set updatetime=250

" Use fontawesome icons as signs
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''


"""" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python' : ['pyls'],
    \ 'sh': ['bash-language-server', 'start']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Show documentation for method
nnoremap <silent> <Leader>K :call LanguageClient_textDocument_hover()<CR>

" Go to definition
nnoremap <silent> <Leader>d :call LanguageClient_textDocument_definition()<CR>

" Rename identifier
nnoremap <silent> <Leader>r :call LanguageClient_textDocument_rename()<CR>

" Search symbols in current buffer
nnoremap <silent> <Leader>s :call LanguageClient_textDocument_documentSymbol()<CR>

" Show a list of all references to identifier under cursor
" Does not seem to work for python-language-server
nnoremap <silent> <Leader>R :call LanguageClient_textDocument_references()<CR>

" Format the entire buffer
nnoremap <silent> <Leader>F :call LanguageClient_textDocument_formatting()<CR>

" Use LanguageClient for gq formatting
set formatexpr=LanguageClient_textDocument_rangeFormatting()

" Use fzf for multiple entries selection
let g:LanguageClient_selectionUI = 'fzf'

let g:LanguageClient_diagnosticsDisplay = {
            \    1: {
            \        "name": "Error",
            \        "texthl": "ALEError",
            \        "signText": "",
            \        "signTexthl": "ALEErrorSign",
            \    },
            \    2: {
            \        "name": "Warning",
            \        "texthl": "ALEWarning",
            \        "signText": "",
            \        "signTexthl": "ALEWarningSign",
            \    },
            \    3: {
            \        "name": "Information",
            \        "texthl": "ALEInfo",
            \        "signText": "",
            \        "signTexthl": "ALEInfoSign",
            \    },
            \    4: {
            \        "name": "Hint",
            \        "texthl": "ALEInfo",
            \        "signText": "H",
            \        "signTexthl": "ALEInfoSign",
            \    },
            \}


"""" vim-sneak
" Use vim-sneak as a lightweight vim-easymotion replacement
" Press s{char}{char} or use z in motions
let g:sneak#label = 1


"""" echodoc
" Enable function signature in cmdline
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'
let g:echodoc#enable_force_overwrite = 0  " NB! Setting to 1 causes flicker


"""" vim-fugitive
" Write to git staging area
nnoremap <Leader>gw :Gw<CR>


"""" vim-gutentags
let g:gutentags_ctags_exclude = ['.mypy_cache', '@.gitignore']


"""" python-mode
" Common functionality
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_paths = []
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 80
let g:pymode_options_colorcolumn = 1
let g:pymode_quickfix_minheight = 1
let g:pymode_quickfix_maxheight = 1

" Python version
let g:pymode_python = 'python3'

" Python indentation
let g:pymode_indent = 1

" Python folding
let g:pymode_folding = 0

" Vim motion
" [[    Jump to previous class or function (normal, visual, operator modes)
" ]]    Jump to next class or function  (normal, visual, operator modes)
" [M    Jump to previous class or method (normal, visual, operator modes)
" ]M    Jump to next class or method (normal, visual, operator modes)
" aC    Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC    Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM    Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM    Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
set magic " Required for pymode_motion
let g:pymode_motion = 1

" Show documentation
let g:pymode_doc = 1
let g:pymode_doc_bind = '<LocalLeader>K'

" Support virtualenv
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV

" Run code
let g:pymode_run = 1
let g:pymode_run_bind = '<LocalLeader>x'

" Breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<LocalLeader>b'
let g:pymode_breakpoint_cmd = ''

" Code checking
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_ignore = ['W504']
let g:pymode_lint_select = []
let g:pymode_lint_sort = []
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1

" Rope support
let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_project_root = ""
let g:pymode_rope_ropefolder='.ropeproject'
let g:pymode_rope_show_doc_bind = '<LocalLeader>D'
let g:pymode_rope_regenerate_on_write = 1

" Completion
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'pathlib', 'typing']
let g:pymode_rope_autoimport_import_after_complete = 1

" Find definition
let g:pymode_rope_goto_definition_bind = '<LocalLeader>d'
let g:pymode_rope_goto_definition_cmd = 'e'

" Refactoring
let g:pymode_rope_rename_bind = '<LocalLeader>r'
let g:pymode_rope_rename_module_bind = '<LocalLeader>R'

" Imports
let g:pymode_rope_organize_imports_bind = '<LocalLeader>I'
let g:pymode_rope_autoimport_bind = '<LocalLeader>i'
let g:pymode_rope_module_to_package_bind = '<C-c>r1p'
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'
let g:pymode_rope_use_function_bind = '<C-c>ru'
let g:pymode_rope_move_bind = '<C-c>rv'
let g:pymode_rope_change_signature_bind = '<LocalLeader>s'

" Undo/Redo changes
nnoremap <LocalLeader>pu :PymodeRopeUndo<CR>
nnoremap <LocalLeader>pr :PymodeRopeRedo<CR>

" Syntax
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all

let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all


"""" pytest.vim
" Test specific construct
nnoremap <silent><LocalLeader>tf <Esc>:Pytest function<CR>
nnoremap <silent><LocalLeader>tF <Esc>:Pytest file<CR>
nnoremap <silent><LocalLeader>tc <Esc>:Pytest class<CR>
nnoremap <silent><LocalLeader>tm <Esc>:Pytest method<CR>
nnoremap <silent><LocalLeader>tp <Esc>:Pytest project<CR>

" Test with looponfail
nnoremap <silent><LocalLeader>Tf <Esc>:Pytest function looponfail<CR>
nnoremap <silent><LocalLeader>TF <Esc>:Pytest file looponfail<CR>
nnoremap <silent><LocalLeader>Tc <Esc>:Pytest class looponfail<CR>
nnoremap <silent><LocalLeader>Tm <Esc>:Pytest method looponfail<CR>
nnoremap <silent><LocalLeader>Tp <Esc>:Pytest project looponfail<CR>

nnoremap <silent><LocalLeader>tn <Esc>:Pytest next<CR>
nnoremap <silent><LocalLeader>tN <Esc>:Pytest previous<CR>
nnoremap <silent><LocalLeader>ts <Esc>:Pytest session<CR>


"""" ranger.vim
let g:ranger_map_keys = 0
map <Leader>f :RangerWorkingDirectoryNewTab<CR>
map <Leader>F :Ranger<CR>
let g:ranger_replace_netrw = 0


"""" tagbar
" Toggle the Tagbar sidesplit with gt
nnoremap <silent>gt <Esc>:TagbarToggle<CR>

" Opten Tagbar to the right
let g:tagbar_left = 0

" Sort tags according to their location in the source file
let g:tagbar_sort = 0

" Only use on space for indent, saving horizontal real estate
let g:tagbar_indent = 1

" Do not show public/private icons, as it is somewhat irrelevant in python
let g:tagbar_show_visibility = 0

" Use fontawesome chevrons for hierarchy icons
let g:tagbar_iconchars = ['', '']

" Always open Tagbar on startup
" Left here in case I would want to enable it at some point
" augroup Startup
"     autocmd!
"     autocmd VimEnter * nested :TagbarOpen
" augroup END


"""" coveragepy.vim
let g:coveragepy_uncovered_sign = ''
nnoremap <silent>gcR <Esc>:Coveragepy report<CR>
nnoremap <silent>gcr <Esc>:Coveragepy refresh<CR>


"""" neoterm
" Open and close persistent terminal buffer on bottom right with: Alt + t
noremap <M-t> <Esc>:botright Ttoggle<CR>
tmap <M-t> <Esc>:botright Ttoggle<CR>

" Automatically move to insert mode in newly opened terminal buffer
let g:neoterm_autoinsert = 1


""" Folding (open every fold with zR)
"" [.vimrc folding with 2+ ""](https://vi.stackexchange.com/a/3820)
"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
