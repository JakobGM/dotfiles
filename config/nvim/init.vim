""" Plugins
filetype off                  " required
let g:polyglot_disabled = ['latex', 'python']

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

" Git
Plug 'jreybert/vimagit'                                                 " Modal git editing with <leader>g
Plug 'tpope/vim-fugitive'                                               " Git plugin with commands 'G<command>'

" Python
Plug 'jpalardy/vim-slime', {'for': 'python'}                            " Send python code to kitty terminal
Plug 'psf/black', { 'tag': '20.8b1' }                                   " Python code formatter

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
Plug 'danro/rename.vim'                                                 " Enables :Rename <new_name>
Plug 'fooSoft/vim-argwrap'                                              " Wrap function arguments with <leader>a
Plug 'godlygeek/tabular'                                                " :Tab /<repexp> in order to allign
Plug 'peterrincker/vim-argumentative'                                   " Shifting arguments with <, and >,
Plug 'tpope/vim-commentary'                                             " Adds comment action with 'gc'
Plug 'tpope/vim-surround'                                               " Adds the surround motion bound to s

" Visual
Plug 'glench/vim-jinja2-syntax'                                         " Better support for Jinja2 syntax
Plug 'lepture/vim-jinja'                                                " Works well in combination with previous plugin
Plug 'gruvbox-community/gruvbox'                                        " Gruvbox colorscheme
Plug 'itchyny/lightline.vim'                                            " Lightweight statusline without slow plugin integrations
Plug 'majutsushi/tagbar'                                                " Open tag navigation split with :Tagbar
Plug 'ryanoasis/vim-devicons'                                           " For file icons in lots of plugins
Plug 'sheerun/vim-polyglot'                                             " Add syntax highlighting for a large range of filetypes
Plug 'thalesmello/lkml.vim'                                             " Syntax highlighting for LookML code
Plug 'luukvbaal/stabilize.nvim'                                         " Stabilize buffer content on pane changes and so on

" Behaviour/tools
Plug 'gillyb/stable-windows'                                            " Keep panes in stable position when layout changes
Plug 'ivanovyordan/dbt.vim'                                             " Syntax highlighting and support for dbt projects (JinjaSQL)
Plug 'neomake/neomake', {'for': ['latex', 'tex', 'plaintex']}           " Linting latex documents
Plug 'nhooyr/neoman.vim'                                                " Using vim as a manpager
Plug 'rhysd/git-messenger.vim'                                          " See git commit message for current line with <Leader>gm
Plug 'tpope/vim-repeat'                                                 " Add repeat support with '.' for lots of plugins
Plug 'tpope/vim-sensible'                                               " Sensible vim defaults
Plug 'voldikss/vim-floaterm'                                            " Floating terminals within vim
Plug 'wakatime/vim-wakatime'                                            " Automatic timetracking of programming [wakatime.com]

" Auto-completion
Plug 'lervag/vimtex'                                                    " LaTeX completion
Plug 'ludovicchabant/vim-gutentags'                                     " Automatically generate ctags on write
Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " Autocompletion framework

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
      \              [ 'readonly', 'relativepath', 'percent', 'modified' ],
      \            ],
      \   'right': [ [ ],
      \              [ 'filetype' ],
      \              [ 'tagbar' ] ]
      \   },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'gitbranch': 'FugitiveHead',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
      \ 'tab': {
      \   'active': [ 'filename', 'modified' ],
      \   'inactive': [ 'filename', 'modified' ],
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'gitbranch' ] ],
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

" Use auocmd to force lightline update when coc.nvim status changes.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


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
let g:lightline_buffer_show_bufnr = 0
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
    highlight SignColumn guibg=bg
    highlight SignColumn ctermbg=bg

    " Make background of error signs the same as a regular sign column
    highlight CocErrorSign guifg=red
    highlight CocErrorSign guibg=bg
    highlight CocErrorSign ctermbg=bg

    " Use underlined, bold, green for current tag
    highlight TagbarHighlight guifg=#b8bb26
    highlight TagbarHighlight gui=bold,underline

    " Highlight search results in bold green
    highlight Search guibg=guibg guifg=#b8bb26 gui=bold,underline cterm=bold,underline

    " Try to use more subdued colors in vimdiff mode
    highlight DiffAdd cterm=bold ctermfg=142 ctermbg=235 gui=NONE guifg=#b8bb26 guibg=#3c3c25
    highlight DiffChange cterm=bold ctermfg=108 ctermbg=235 gui=NONE guifg=#8ec07c guibg=#383228
    highlight DiffText cterm=NONE ctermfg=214 ctermbg=235 gui=NONE guifg=#fabd2f guibg=#483D28
    highlight DiffDelete cterm=bold ctermfg=167 ctermbg=235 gui=NONE guifg=#fb4934 guibg=#372827

    " Use Gruvbox colors for python semshi semantic highlighter
    hi semshiGlobal          ctermfg=167 guifg=#fb4934
    hi semshiImported        ctermfg=214 guifg=#fabd2f cterm=bold gui=bold
    hi semshiParameter       ctermfg=142  guifg=#98971a
    hi semshiParameterUnused ctermfg=106 guifg=#665c54
    hi semshiBuiltin         ctermfg=208 guifg=#fe8019
    hi semshiAttribute       ctermfg=108  guifg=fg
    hi semshiSelf            ctermfg=109 guifg=#85a598
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
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
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Remap shift + arrow keys to open new tabs
nnoremap <S-Left> :0tabnew<CR>
nnoremap <S-Right> :$tabnew<CR>

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

nnoremap <silent> <Leader>gf :call PutFixupCommandInPasteBoard()<CR>

function! ConstructGithubMarkdownLink() abort
  " Paste the following markdown into the pasteboard:
  " [`ClassName.method_name()`](<github_line_link>)
  let tagname = tagbar#currenttag("%s", "", "f")
  let url = split(execute(".Gbrowse!"))[5]
  let markdown = "[`" . tagname . "`](" . url . ")"
  let @+ = markdown
endfunction

nnoremap <silent> <Leader>md :call ConstructGithubMarkdownLink()<CR>

function! PutFixupCommandInPasteBoard() abort
  let filepath = expand('%:p')
  let line_number = line('.')
  let sha1_hash = system(
    \ 'git blame ' .
    \ '-L ' . line_number . ',' . line_number . 
    \ ' --porcelain ' . filepath . 
    \ ' | xargs | cut -f 1 -d " "'
    \ )
  execute 'normal! :Gcommit --fixup ' . sha1_hash
endfunction

" Source vimrc config file
nnoremap gsv :so $MYVIMRC<CR>

" Clear search highlighting
nnoremap <Esc><Esc> :noh<CR>

" Navigate between diagnostic items in signcolumn
nmap <silent> <Leader>q <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>Q <Plug>(coc-diagnostic-prev)

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

" Switch to alternative file, most often the previous buffer
nnoremap <CR> :b#<CR>


""" Commands
" Write to the current file as sudo
cmap w!! w !sudo tee > /dev/null %


""" Python

" Python path for current python project, used with Jedi-vim
let g:python3_host_prog = $HOME.'/.virtualenvs/NeoVim3/bin/python'


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

" Prefer python3 when both can be used
set pyx=3


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
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --fixed-strings --smart-case --hidden --follow --glob "!.git/*" --color=always '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 2..'}, 'right:50%'),
  \   <bang>0
  \ )

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --exclude=@.gitignore --exclude=.mypy_cache --exclude=node_modules --kinds-python=cfmIix --languages=python'


"""" vim-gutentags
" Exclude file patterns
let g:gutentags_ctags_exclude = [ ".mypy_cache", "@.gitignore", "node_modules" ]
let g:gutentags_ctags_extra_args = [ "--kinds-python=cfmIix", "--languages=python" ]

"""" Vimagit
nnoremap <leader>gg :Magit<CR>
nnoremap <leader>gp :! git push<CR>

" Enable deletion of untracked files in Magit
let g:magit_discard_untracked_do_delete=1


"""" vim-fugitive
" Write to git staging area
nnoremap <Leader>gw :Gw<CR>


""" vim-rhubarb
nnoremap <Leader>gb :Gblame<CR>


"""" tagbar
" Toggle the Tagbar sidesplit with gt
" nnoremap <silent><Leader>gt <Esc>:TagbarToggle<CR>

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
nnoremap <Leader>gh :Gbrowse!<CR>:Gbrowse<CR>
vnoremap <Leader>gh :GBrowse!<CR>gv:Gbrowse<CR>


"""" black
" Skip bytecode verification
let g:black_fast = 1

" Width of code before it gets wrapped
let g:black_linelength = 88

" Normalize all strings to use double quotes
let g:black_skip_string_normalization = 0

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

" Enable SyncTeX support
let R_synctex = 1

" Uncomment if you want to use tmux + kitty for R REPL
" let R_in_buffer = 0
" let R_in_buffer = 0
" let R_term = 'kitty'
" let R_term_cmd = 'kitty --title Nvim-R --name Nvim-R --instance-group Nvim-R'

"""" vim-pandoc-syntax
" Disable fancy mathematics rendering
let g:pandoc#syntax#conceal#use = 0

"""" vim-pandoc
" Disable folding of sections and automatic directory change
let g:pandoc#modules#disabled = ["folding", "chdir"]


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
    \   '-pdflatex=lualatex',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_view_method = 'zathura'

" Enable vimtex for all .tex files
let g:tex_flavor = 'latex'


"""" coc.nvim
" Extensions need to be installed at first startup
" :CocInstall coc-json coc-pyright coc-snippets coc-git coc-r-lsp coc-html coc-css coc-highlight coc-vimlsp

" Tweak insert mode completion
"   noinsert: Do not insert text before accepting the completion
"   menuone: Use the popup menu even if there is only one match
"   noselect: Do not select a match in the menu, force manual selection
set completeopt=noinsert,menuone,noselect

" Snippet expand and additional edit feature of LSP requires confirm
" completion to work.
set confirm

" Do not show in-completion-menu messages, e.g. 'match 1 of 2'
set shortmess+=c

" Escape completion with ctrl+c
inoremap <C-c> <ESC>

" Update sign column every quarter second
set updatetime=300

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Navigate diagnostics
nmap <silent> <Leader>en <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>eN <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> <Leader>d <Plug>(coc-definition)

" Remap keys for gotos
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <Leader>R <Plug>(coc-references)

" Use K and <Leader>K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent><Leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region
vmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>Q  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python, coc-yank
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <Leader>cd :<C-u>CocList diagnostics<cr>

" Manage extensions
nnoremap <silent> <Leader>ce :<C-u>CocList extensions<cr>

" Show commands
nnoremap <silent> <Leader>ce :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <Leader>S :<C-u>CocList outline<cr>

" Search workspace symbols
nnoremap <silent> <Leader>s :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent> <Leader>cj :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> <Leader>ck :<C-u>CocPrev<CR>

" Resume latest coc list
nnoremap <silent> <Leader>cl :<C-u>CocListResume<CR>


"""" coc-snippets
" Use tab for snippets and trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Edit UltiSnips snippets for the current file
nnoremap <Leader>us :CocCommand snippets.editSnippets<CR>


"""" coc-git
" Navigate chunks of current buffer
nmap <Leader>gN <Plug>(coc-git-prevchunk)
nmap <Leader>gn <Plug>(coc-git-nextchunk)

" Hunk-add and hunk-revert for chunk staging
nmap <silent><Leader>ga :CocCommand git.chunkStage<CR>
nmap <silent><Leader>gu :CocCommand git.chunkUndo<CR>

" Show chunk diff at current position
nmap <Leader>gd <Plug>(coc-git-chunkinfo)

" Show commit contains current position
nmap <Leader>gc <Plug>(coc-git-commit)


"""" coc-yank
nnoremap <silent><Leader>y :<C-u>CocList -A --normal yank<cr>


""" coc-pyright
command! -nargs=0 SortImports call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <c-i> :SortImports<CR>


"""" git-messenger
let g:git_messenger_no_default_mappings = v:true
nmap <Leader>gm <Plug>(git-messenger)


" List of highlight groups not to highlight.
let g:semshi#excluded_hl_groups = [ 'local', 'attribute', 'free', 'unresolved' ]

" Mark selected nodes (those with the same name and scope as the one under the cursor).
let g:semshi#mark_selected_nodes = 0

" Show a sign in the sign column if a syntax error occurred.
let g:semshi#error_sign = v:false


"""" vim-slime
" Put temporary paste file in temporary directory
let g:slime_paste_file = "/tmp/.slime_paste"

" Use kitty terminal as the target environment
let g:slime_target = "kitty"

" Use the second kitty window as default
let g:slime_default_config = {"window_id": "2"}

" Use %cpaste magic in python files
let g:slime_python_ipython = 1

" Send visual selection
vnoremap <CR> <Plug>SlimeRegionSend

" Send current line and move one line down
" nmap <CR> :<c-u>call slime#send_lines(v:count1)<cr>j


"""" Neomake
"Run neomake
nnoremap <Leader>m :Neomake<CR>

" Automatically open Neomake list when it is populated
" let g:neomake_open_list = 2

" Use same icons as coc-settings.json
let g:neomake_warning_sign = {
  \ 'text': '',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '',
  \ 'texthl': 'ErrorMsg',
  \ }


"""" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

"""" stabilize.nvim
" Enable the plugin
lua << EOF
require("stabilize").setup()
EOF

" Modifications made to vim-slime (kept for posterity)
" Source file: config/nvim/plugged/vim-slime/autoload/slime.vim
  " call system("kitty @ --to unix:@slime send-text --from-file " . g:slime_paste_file)
  " call system("kitty -o allow_remote_control=yes --listen-on=unix:@slime --detach")


"""" voldikss/vim-floaterm
" Create an IPython scratchpad
command FloatermSpawnIPython FloatermNew! --name=ipython --silent clear && ipython
command FloatermSpawnTerminal FloatermNew! --name=terminal --silent clear

" Run the command defined above on startup
autocmd VimEnter * FloatermSpawnIPython
autocmd VimEnter * FloatermSpawnTerminal

" Toggle the ipython terminal with ctrl+p
map <C-p> :FloatermToggle ipython<CR>
tmap <C-p> <esc>:FloatermToggle ipython<CR>

" Toggle the floating terminal with ctrl+t
map <C-t> :FloatermToggle terminal<CR>
tmap <C-t> <esc>:FloatermToggle terminal<CR>
