-- Display \t as 8 visual spaces (recommended setting)
vim.opt.tabstop = 8

-- Tab is replaced by the spaces specified as above
vim.opt.expandtab = true

-- When vim smartwraps overflowing text, the text on the new line is indented properly
vim.opt.breakindent = true

-- Don't let the filetype plugin insert newlines automatically
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

-- Do not let vim force line breaks when exceeding textwidth in insert mode
vim.opt.formatoptions:remove("t")

-- Let status line span across multiple panes (showing info for focused pane)
vim.opt.laststatus = 3
