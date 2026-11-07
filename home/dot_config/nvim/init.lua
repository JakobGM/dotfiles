-- Set the global and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy_bootstrap")
local lazy = require("lazy")
local lazy_config = {
  change_detection = { enabled = false },
}
lazy.setup(require("plugins"), lazy_config)
require("formatting")
require("keymaps")
require("visual")
require("behavior")
