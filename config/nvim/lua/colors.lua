-- Custom highlighting
function MyHighlights()
  -- Define BadWhitespace before using in a match
  vim.cmd.highlight { "BadWhitespace", "ctermbg=red", "guibg=darkred" }

  -- Highlight spelling mistakes in red
  vim.cmd.highlight { "SpellBad", "cterm=underline", "ctermfg=red", "guifg=red" }

  -- Do not use separate background color in sign column
  vim.cmd.highlight { "SignColumn", "guibg=bg" }

  -- Make background of error signs the same as a regular sign column
  vim.cmd.highlight { "CocErrorSign", "guifg=red" }
  vim.cmd.highlight { "CocErrorSign", "guibg=bg" }

  -- When coc.nvim renders errors/warnings/info/hints,
  -- do not change the background color in the signcolumn
  vim.cmd.highlight { "CocErrorHighlight", "guibg=bg", "guifg=#cc241d" }
  vim.cmd.highlight { "CocWarningSign", "guibg=bg", "guifg=#d79921" }
  vim.cmd.highlight { "CocInfoSign", "guibg=bg", "guifg=#458588" }
  vim.cmd.highlight { "CocHintSign", "guibg=bg", "guifg=#689d6a" }

  -- Use underlined, bold, green for current tag
  vim.cmd.highlight { "TagbarHighlight", "guifg=#b8bb26" }
  vim.cmd.highlight { "TagbarHighlight", "gui=bold,underline" }

  -- Highlight search results in bold green
  vim.cmd.highlight { "Search", "guibg=dark0", "guifg=#b8bb26", "gui=bold,underline", "cterm=bold,underline" }

  -- Try to use more subdued colors in vimdiff mode
  vim.cmd.highlight { "DiffAdd", "cterm=bold", "ctermfg=142", "ctermbg=235", "gui=NONE", "guifg=#b8bb26", "guibg=#3c3c25" }
  vim.cmd.highlight { "DiffChange", "cterm=bold", "ctermfg=108", "ctermbg=235", "gui=NONE", "guifg=#8ec07c",
    "guibg=#383228" }
  vim.cmd.highlight { "DiffText", "cterm=NONE", "ctermfg=214", "ctermbg=235", "gui=NONE", "guifg=#fabd2f",
    "guibg=#483D28" }
  vim.cmd.highlight { "DiffDelete", "cterm=bold", "ctermfg=167", "ctermbg=235", "gui=NONE", "guifg=#fb4934",
    "guibg=#372827" }
end

-- MyColors group
local myColorsGrp = vim.api.nvim_create_augroup("MyColors", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme *", {
  command = "lua MyHighlights()",
  group = myColorsGrp,
})

-- Use 256 colors in gui_running mode
if not vim.api.nvim_eval("has('gui_running')") then
  vim.opt.t_Co = 256
end

-- Make sure that 256 colors are used
vim.opt.termguicolors = true
