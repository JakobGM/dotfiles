" INFO: Show all content hidden by the folds by pressing zR

""" Plugins
filetype off                  " required

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

" Git
Plug 'airblade/vim-gitgutter'                                           " Show git diff in number column
Plug 'jreybert/vimagit'                                                 " Modal git editing with <leader>g
Plug 'tpope/vim-fugitive'                                               " Git plugin with commands 'G<command>'

" Python
Plug 'ambv/black'                                                       " Python code formatter
Plug 'tweekmonster/django-plus.vim'                                     " Better django specific support
Plug 'vim-python/python-syntax'                                         " Better syntax highlighting for python
Plug 'vimjas/vim-python-pep8-indent'                                    " More PEP8 compliant python indentation

" R-lang
Plug 'jalvesaq/Nvim-R'                                                  " Adds lots of Rlang-support
Plug 'vim-pandoc/vim-pandoc'                                            " Integration with the pandoc document converter
Plug 'vim-pandoc/vim-pandoc-syntax'                                     " Syntax for pandoc supported filetypes

" Navigation
Plug 'christoomey/vim-tmux-navigator'                                   " Navigate between tmux and vim with <C>+jkhl
Plug 'cskeeters/vim-smooth-scroll'                                      " Smooth scroll animation instead of jump
Plug 'farmergreg/vim-lastplace'                                         " Move cursor to last edit location when reopening files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }       " Fuzzy file++ searching
Plug 'junegunn/fzf.vim'                                                 " Asynchronous file/tags searcher
Plug 'tpope/vim-rhubarb'                                                " Open GitHub source with :Gbrowse and autocompletion for GitHub issues

" Editing
Plug 'danro/rename.vim'                                                 " Enables :rename <new_name>
Plug 'fooSoft/vim-argwrap'                                              " Wrap function arguments with <leader>a
Plug 'godlygeek/tabular'                                                " :Tab /<repexp> in order to allign
Plug 'tpope/vim-commentary'                                             " Adds comment action with 'gc'
Plug 'tpope/vim-surround'                                               " Adds the surround motion bound to s

" Visual
Plug 'elzr/vim-json', {'for': 'json'}                                   " Better syntax highlighting for JSON files
Plug 'itchyny/lightline.vim'                                            " Lightweight statusline without slow plugin integrations
Plug 'jakobgm/lightline-gruvbox.vim', { 'branch': 'patch-1' }           " Gruvbox theme for the lightline statusline
Plug 'majutsushi/tagbar'                                                " Open tag navigation split with :Tagbar
Plug 'morhetz/gruvbox'                                                  " Gruvbox colorscheme
Plug 'ryanoasis/vim-devicons'                                           " For file icons in lots of plugins
Plug 'sheerun/vim-polyglot'                                             " Add syntax highlighting for a large range of filetypes
Plug 'taohex/lightline-buffer'                                          " Buffer-bar plugin for lightline

" Behaviour/tools
Plug 'ludovicchabant/vim-gutentags'                                     " Automatically create ctag files
Plug 'nhooyr/neoman.vim'                                                " Using vim as a manpager
Plug 'romainl/vim-qf'                                                   " Automatically close quickfix windows that become orphaned
Plug 'tpope/vim-repeat'                                                 " Add repeat support with '.' for lots of plugins
Plug 'tpope/vim-sensible'                                               " Sensible vim defaults
Plug 'wakatime/vim-wakatime'                                            " Automatic timetracking of programming [wakatime.com]

" Auto-completion
Plug 'gaalcaras/ncm-R'                                                  " Rlang completion
Plug 'honza/vim-snippets'                                               " Gives a whole lot of UltiSnips prebuilt snippets
Plug 'lervag/vimtex'                                                    " LaTeX completion
Plug 'ncm2/ncm2'                                                        " Completion manager
Plug 'ncm2/ncm2-bufword'                                                " Completion words from current buffer
Plug 'ncm2/ncm2-cssomni'                                                " Wrap css omnifunc for ncm2 with one singule function call
Plug 'ncm2/ncm2-html-subscope'                                          " Detect javascript/css subscope from html code 
Plug 'ncm2/ncm2-markdown-subscope'                                      " Fenced code block detection in markdown files for ncm2 
Plug 'ncm2/ncm2-path'                                                   " Filepath completion
Plug 'ncm2/ncm2-tern', {'do': 'npm install'}                            " Javascript completion
Plug 'roxma/nvim-yarp'                                                  " Dependency of ncm2/ncm2
Plug 'sirver/ultisnips'                                                 " For inserting snippets

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

  try
    let repository = matchlist(line, plugin_name)[2]

    " Open the corresponding GitHub homepage with $BROWSER
    " You need to set the BROWSER environment variable in order for this to work
    " For MacOS, you can set the following for opening it in your default
    " browser: 'export BROWSER=open'
    silent exec "!$BROWSER https://github.com/".repository
  catch /.*/
    echo 'No match for "<user>/<repository>" on this line!'
  endtry
endfunction

" Open and close folds with Enter
nnoremap <expr> <cr>   foldlevel(line('.'))  ? "za" : "\<cr>"

" Source vimrc config file
nnoremap gsv :so $MYVIMRC<CR>

" Clear search highlighting
nnoremap <Esc><Esc> :noh<CR>

" Bind g(q|Q) to next item in quickfix list
" Mnemonic: "See position of keys on keyboard, including q for quickfix"
nnoremap <silent> <Leader>q :cn<CR>
nnoremap <silent> <Leader>o :cp<CR>

" Bind g(l|L) to next item in location list
" Mnemonic: "go location"
nnoremap <silent> <Leader>l :lne<CR>
nnoremap <silent> <Leader>L :lp<CR>

" Redraw syntax highlighting when color disappears
" Mnemonic: "go source syntax"
nnoremap gss :syntax sync fromstart<CR>

" Open vertical split with Space + v
nnoremap <silent> <Leader>v :vsplit<CR>


function! EditFiltetypeConfig() abort
  let filepath = $XDG_CONFIG_HOME . '/nvim/ftplugin/' . &filetype . '.vim'
  execute 'vsp ' . filepath
endfunction

nnoremap <Leader>ft :call EditFiltetypeConfig()<CR>


""" Commands
" Write to the current file as sudo
cmap w!! w !sudo tee > /dev/null %


""" Python

" Proper indentation for python files
au BufNewFile,BufRead *.py
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set softtabstop=4  " Pressing tab during editing operations inserts 4 spaces |
    \ set shiftwidth=4  " Number of spaces used for each step of an (auto)indent action, e.g. '>>'. |
    \ let python_highlight_all=1  " Enable python highlighting

" Flag unnecessary whitespace in python files
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Python path for current python project, used with Jedi-vim
let g:python3_host_prog = $HOME.'/.virtualenvs/NeoVim3/bin/python'
let g:python2_host_prog = $HOME.'/.virtualenvs/NeoVim2/bin/python'


""" htmldjango
au FileType htmldjango
    \ set shiftwidth = 2 |
    \ set softtabstop = 2


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

" Copy to system clipboard
vnoremap  <leader>y  "+y
vnoremap  <leader>Y  "+yg$
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from system clipboard
nnoremap <leader>p :set paste<CR> "+p :set nopaste<CR>
nnoremap <leader>P :set paste<CR> "+P :set nopaste<CR>
vnoremap <leader>p :set paste<CR> "+p :set nopaste<CR>
vnoremap <leader>P :set paste<CR> "+P :set nopaste<CR>

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

" Source .exrc files in project directories for project-specific vim settings
set exrc

" Only allow sourcing of unsafe commands if such files are owned by my user
set secure


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
nnoremap <silent> <leader>hh :Helptags<CR>

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


"""" vim-gitgutter
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk
nmap <Leader>gN <Plug>GitGutterPrevHunk

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
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python' : ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'sh': ['bash-language-server', 'start']
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Show documentation for method
nnoremap <silent> <Leader>K :call LanguageClient_textDocument_hover()<CR>

" Go to definition
nnoremap <silent> <Leader>d :call LanguageClient_textDocument_definition()<CR>

" Show short type and doc information
nnoremap <silent> <Leader>D :call LanguageClient_textDocument_hover()<CR>

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
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

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

" Never use preview window on hover, only echo to cmdline
let g:LanguageClient_hoverPreview = 'Never'

" Uncomment for debugging LanguageClient-neovim
" inoremap <silent> <c-q> <esc>:<c-u>q!<cr>
" let g:LanguageClient_loggingFile = '/tmp/lc.log'
" let g:LanguageClient_loggingLevel = 'DEBUG'


"""" vim-fugitive
" Write to git staging area
nnoremap <Leader>gw :Gw<CR>


"""" vim-gutentags
let g:gutentags_ctags_exclude = ['.mypy_cache', '@.gitignore']


"""" tagbar
" Toggle the Tagbar sidesplit with gt
nnoremap <silent>gt <Esc>:TagbarToggle<CR>

" Open Tagbar to the right
let g:tagbar_left = 0

" Sort tags according to their location in the source file
let g:tagbar_sort = 0

" Only use on space for indent, saving horizontal real estate
let g:tagbar_indent = 1

" Do not show public/private icons, as it is somewhat irrelevant in python
let g:tagbar_show_visibility = 0

" Use fontawesome chevrons for hierarchy icons
let g:tagbar_iconchars = ['', '']


"""" vim-rhubarb
" Open current line on GitHub
nnoremap <Leader>gh V:Gbrowse<CR>


"""" ncm2
" Enable completion for all filetypes
autocmd BufEnter * call ncm2#enable_for_buffer()

" Tweak insert mode completion
"   noinsert: Do not insert text before accepting the completion
"   menuone: Use the popup menu even if there is only one match
"   noselect: Do not select a match in the menu, force manual selection
set completeopt=noinsert,menuone,noselect

" Do not show in-completion-menu messages, e.g. 'match 1 of 2'
set shortmess+=c

" Escape completion with ctrl+c
inoremap <C-c> <ESC>


"""" ncm2-cssomni
call ncm2#register_source({'name' : 'css',
            \ 'priority': 9, 
            \ 'subscope_enable': 1,
            \ 'scope': ['css', 'scss', 'less'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni',
            \               'csscomplete#CompleteCSS'],
\ })


"""" black
" Skip bytecode verification
let g:black_fast = 1

" Width of code before it gets wrapped
let g:black_linelength = 80

" Do not change my precious single quote strings!
let g:black_skip_string_normalization = 1

" Virtual environment path used to run black
let g:black_virtualenv = '~/.virtualenvs/black'


"""" Nvim-R
" Disable replacing underscore with '->'
let R_assign_map = '<M-->'
let R_assign = 0

" Enable the use of library(colorout) for colorized R terminals
let R_in_buffer = 1

" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1

" R commands in R output are highlighted
let g:Rout_more_colors = 1


"""" vim-pandoc-syntax
" Disable fancy mathematics rendering
let g:pandoc#syntax#conceal#use = 0

"""" vim-pandoc
" Disable folding of sections and automatic directory change
let g:pandoc#modules#disabled = ["folding", "chdir"]


"""" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:UltiSnipsSnippetsDir="$XDG_CONFIG_HOME/nvim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"
nnoremap <Leader>us :UltiSnipsEdit<CR>


"""" vim-polyglot
" Prevent conflict with vimtex
let g:polyglot_disabled = ['latex']


"""" vimtex
" Start vim client server for backwards search from PDF file
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_view_method = 'zathura'

""" Folding (open every fold with zR)
"" [.vimrc folding with 2+ ""](https://vi.stackexchange.com/a/3820)
"" vim:fdm=expr:fdl=0
"" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
