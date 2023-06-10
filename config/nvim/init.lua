vim.g.python3_host_prog = os.getenv("XDG_CONFIG_HOME") .. "/nvim/.venv/bin/python"

-- Set the global and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy_bootstrap")
local lazy = require("lazy")
if vim.g.vscode then
  lazy.setup("vscode")
else
  lazy.setup("plugins")
end
require("formatting")
require("keymaps")
require("visual")
require("performance")
require("behavior")
