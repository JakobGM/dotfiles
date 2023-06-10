-- iTerm2 Esc+ mode for the alt/meta key prevents insertion of Norwegian characters on english keyboards
vim.keymap.set('i', '<M-e>', 'æ')
vim.keymap.set('i', '<M-o>', 'ø')
vim.keymap.set('i', '<M-a>', 'å')

-- Write to file
vim.keymap.set('n', '<Leader>w', '<Esc>:w<CR>')

-- Make Y yank the rest of the line
vim.keymap.set('n', 'Y', 'y$')

-- Remap arrow keys to buffer switching
vim.keymap.set('n', '<Left>', ':tabprevious<CR>')
vim.keymap.set('n', '<Right>', ':tabnext<CR>')

-- Remap shift + arrow keys to open new tabs
vim.keymap.set('n', '<S-Left>', ':0tabnew<CR>')
vim.keymap.set('n', '<S-Right>', ':$tabnew<CR>')

-- Toggle light/dark background
vim.keymap.set('n', '<Leader>bg', ":let &background = ( &background == 'dark'? 'light' : 'dark' )<CR>")

-- Keybinding for visiting the GitHub page of the plugin defined on the current line
vim.keymap.set('n', 'gp', function() OpenPluginHomepage() end)

function OpenPluginHomepage()
  -- Get line under cursor
  local line = vim.api.nvim_get_current_line()

  -- Matches for instance Plug 'tpope/surround' -> tpope/surround
  -- Greedy match in order to not capture trailing comments
  local plugin_name = "Plug '(.*)'"

  local repository = string.match(line, plugin_name)

  if repository then
    -- Open the corresponding GitHub homepage with $BROWSER
    vim.api.nvim_command('silent !' .. os.getenv('BROWSER') .. ' https://github.com/' .. repository)
  else
    print('No match for "<user>/<repository>" on this line!')
  end
end

-- Paste a markdown link to the tag under the cursor to the clipboard
vim.keymap.set('n', '<Leader>md', function() ConstructGithubMarkdownLink() end)

function ConstructGithubMarkdownLink()
  local tagname = vim.fn['tagbar#currenttag']('%s', '', 'f')
  local url = vim.fn.split(vim.fn.execute('.GBrowse!'))[5]
  local markdown = "[`" .. tagname .. "`](" .. url .. ")"
  vim.fn.setreg('+', markdown)
end

-- Construct git fixup command and put it in the pasteboard
vim.keymap.set('n', '<Leader>gf', function() PutFixupCommandInPasteBoard() end)

function PutFixupCommandInPasteBoard()
  local filepath = vim.fn.expand('%:p')
  local line_number = vim.fn.line('.')
  local sha1_hash = vim.fn.system(
    'git blame ' ..
    '-L ' .. line_number .. ',' .. line_number ..
    ' --porcelain ' .. filepath ..
    ' | xargs | cut -f 1 -d " "'
  )
  vim.fn.setreg('+', 'Git commit --fixup ' .. sha1_hash)
end

-- Source vimrc config file
vim.keymap.set('n', 'gsv', ':so $MYVIMRC<CR>')

-- Clear search highlighting
vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>')

-- Navigate between diagnostic items in signcolumn
vim.keymap.set('n', '<Leader>q', '<Plug>(coc-diagnostic-next)')
vim.keymap.set('n', '<Leader>Q', '<Plug>(coc-diagnostic-prev)')

-- Bind g(l|L) to next item in location list
vim.keymap.set('n', '<Leader>l', ':lne<CR>')
vim.keymap.set('n', '<Leader>L', ':lp<CR>')

-- Redraw syntax highlighting when color disappears
vim.keymap.set('n', 'gss', ':syntax sync fromstart<CR>')

-- Open vertical split with Space + v
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')

-- Edit filetype config
function EditFiltetypeConfig()
  local filepath = os.getenv('XDG_CONFIG_HOME') .. '/nvim/ftplugin/' .. vim.bo.filetype .. '.lua'
  vim.api.nvim_command('vsp ' .. filepath)
end

vim.api.nvim_command('command FT call v:lua.EditFiltetypeConfig()')

-- Switch to alternative file, most often the previous buffer
vim.keymap.set('n', '<CR>', ':b#<CR>')
