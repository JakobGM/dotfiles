-- Early exit if in VS Code
if vim.g.vscode then
  return {}
end

-- Save space by only having one line for cmdline
vim.opt.cmdheight = 1

-- Start scrolling when 7 lines from bottom of screen
vim.opt.scrolloff = 7

-- Relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Do not show command in bottom bar
vim.opt.showcmd = false

-- Highlight current line
vim.opt.cursorline = true

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

-- Show directory hierarchy in netrw
vim.g.netrw_liststyle = 3

-- Remove directory banner in netrw
vim.g.netrw_banner = 0

-- Prevent duplicate netrw buffers (bug caused by vinegar)
-- See: https://codeyarns.com/2015/02/02/cannot-close-buffer-of-netrw-in-vim/
local netrwGroup = vim.api.nvim_create_augroup('NetrwGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'netrw',
  group = netrwGroup,
  command = 'setl bufhidden=wipe',
})

-- Automatically place help buffer in vertical split layout
local helpGroup = vim.api.nvim_create_augroup('HelpGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*/doc/*',
  group = helpGroup,
  command = "if &filetype=='help' | wincmd L | endif",
})
