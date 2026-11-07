-- Remove the empty line beneath the status line and
-- let the command line take its place when needed
vim.opt.cmdheight = 0

-- Start scrolling when 7 lines from bottom of screen
vim.opt.scrolloff = 7

-- Relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Do not show command in bottom bar
vim.opt.showcmd = false

-- Hide fold numbering in left column
vim.opt.foldcolumn = "0"

-- Do not wrap text at the end of the screen
vim.opt.wrap = false

-- Disable line numbering in terminal buffer
local termGroup = vim.api.nvim_create_augroup('TermGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = '*',
  group = termGroup,
  command = 'setlocal nonumber norelativenumber',
})

-- Show live substitution results when using :s
vim.opt.inccommand = 'nosplit'

-- Hide cursorline in inactive window
local crosshairGroup = vim.api.nvim_create_augroup('CrossHair', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  group = crosshairGroup,
  command = 'setlocal cursorline',
})
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
  group = crosshairGroup,
  command = 'setlocal cursorline',
})
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  group = crosshairGroup,
  command = 'setlocal cursorline',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  group = crosshairGroup,
  command = 'setlocal nocursorline',
})

-- Automatically place help buffer in vertical split layout
local helpGroup = vim.api.nvim_create_augroup('HelpGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*/doc/*',
  group = helpGroup,
  command = "if &filetype=='help' | wincmd L | endif",
})
