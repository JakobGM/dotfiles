-- Behaviour

-- When searching ignore case
vim.opt.ignorecase = true

-- Except when using Capital letters
vim.opt.smartcase = true

-- Move to first search occurence which matches
vim.opt.incsearch = true

-- Highlight search matches
vim.opt.hlsearch = true

-- Keep the same screen lines in all split windows
-- Recommended by luukvbaal/stabilize.nvim README.md
vim.opt.splitkeep = "screen"

-- Open new splits to the right and below (feels more natural)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Maintain undo history between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.env.XDG_CONFIG_HOME .. "/nvim/undodir"

-- Neovim terminal commands
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-R>', [[<C-\><C-N>"' . nr2char(getchar()) . 'pi']], { noremap = true, expr = true })
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })

-- Required for operations modifying multiple buffers like rename (used by nLSP)
vim.opt.hidden = true

-- Turn Vim swapfile off
vim.opt.swapfile = false

-- Save valid words to file (used with :set spell)
vim.opt.spellfile = vim.env.XDG_CONFIG_HOME .. "/nvim/spell/en.utf-8.add"

-- Make < > shifts keep selection
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })

-- Do not show preview window when completing items
vim.opt.completeopt:remove("preview")

-- Enable spellchecking in natural language files
local naturalLanguageGroup = vim.api.nvim_create_augroup('NaturalLanguage', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.md,*.rst,*.txt',
  group = naturalLanguageGroup,
  command = 'setlocal spell spelllang=en_us',
})
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'gitcommit',
  group = naturalLanguageGroup,
  command = 'setlocal spell spelllang=en_us',
})

-- Use word completion when spelling is enabled
vim.opt.complete:append("kspell")

-- Source .exrc files in project directories for project-specific vim settings
vim.opt.exrc = true

-- Only allow sourcing of unsafe commands if such files are owned by my user
vim.opt.secure = true

-- Prefer python3 when both can be used
vim.opt.pyx = 3
