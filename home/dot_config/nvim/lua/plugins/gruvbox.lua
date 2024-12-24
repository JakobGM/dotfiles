-- Gruvbox colorscheme
return {
  "luisiacc/gruvbox-baby",
  branch = "main",
  lazy = false,
  priority = 1000,
  config = function()
    require("colors")
    local gruvbox = require("gruvbox-baby.colors")
    vim.cmd [[colorscheme gruvbox-baby]]
  end,
}
