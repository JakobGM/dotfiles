-- Custom highlighting
function MyHighlights()
  -- Define BadWhitespace before using in a match
  vim.cmd.highlight { "BadWhitespace", "ctermbg=red", "guibg=darkred" }

  -- Highlight spelling mistakes in red
  vim.cmd.highlight { "SpellBad", "cterm=underline", "ctermfg=red", "guifg=red" }

  -- Do not use separate background color in sign column
  vim.cmd.highlight { "SignColumn", "guibg=bg" }
  vim.cmd.highlight { "SignColumn", "ctermbg=bg" }

  -- Make background of error signs the same as a regular sign column
  vim.cmd.highlight { "CocErrorSign", "guifg=red" }
  vim.cmd.highlight { "CocErrorSign", "guibg=bg" }
  vim.cmd.highlight { "CocErrorSign", "ctermbg=bg" }

  -- Use underlined, bold, green for current tag
  vim.cmd.highlight { "TagbarHighlight", "guifg=#b8bb26" }
  vim.cmd.highlight { "TagbarHighlight", "gui=bold,underline" }

  -- Highlight search results in bold green
  vim.cmd.highlight { "Search", "guibg=guibg", "guifg=#b8bb26", "gui=bold,underline", "cterm=bold,underline" }

  -- Try to use more subdued colors in vimdiff mode
  vim.cmd.highlight { "DiffAdd", "cterm=bold", "ctermfg=142", "ctermbg=235", "gui=NONE", "guifg=#b8bb26", "guibg=#3c3c25" }
  vim.cmd.highlight { "DiffChange", "cterm=bold", "ctermfg=108", "ctermbg=235", "gui=NONE", "guifg=#8ec07c",
    "guibg=#383228" }
  vim.cmd.highlight { "DiffText", "cterm=NONE", "ctermfg=214", "ctermbg=235", "gui=NONE", "guifg=#fabd2f",
    "guibg=#483D28" }
  vim.cmd.highlight { "DiffDelete", "cterm=bold", "ctermfg=167", "ctermbg=235", "gui=NONE", "guifg=#fb4934",
    "guibg=#372827" }

  -- Use Gruvbox colors for python semshi semantic highlighter
  vim.cmd.highlight { "semshiGlobal", "ctermfg=167", "guifg=#fb4934" }
  vim.cmd.highlight { "semshiImported", "ctermfg=214", "guifg=#fabd2f", "cterm=bold", "gui=bold" }
  vim.cmd.highlight { "semshiParameter", "ctermfg=142", "guifg=#98971a" }
  vim.cmd.highlight { "semshiParameterUnused", "ctermfg=106", "guifg=#665c54" }
  vim.cmd.highlight { "semshiBuiltin", "ctermfg=208", "guifg=#fe8019" }
  vim.cmd.highlight { "semshiAttribute", "ctermfg=108", "guifg=fg" }
  vim.cmd.highlight { "semshiSelf", "ctermfg=109", "guifg=#85a598" }
  vim.cmd.highlight { "semshiSelected", "ctermfg=231", "guifg=#ffffff", "ctermbg=161", "guibg=#d7005f" }
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
