vim.g.python3_host_prog = os.getenv("XDG_CONFIG_HOME") .. "/nvim/.venv/bin/python"

-- Set the global and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy_bootstrap")
local lazy = require("lazy")
local lazy_config = {
  change_detection = { enabled = false },
}
if vim.g.vscode then
  lazy.setup("vscode", lazy_config)
else
  lazy.setup(require("plugins"), lazy_config)
end
require("formatting")
require("keymaps")
require("visual")
require("behavior")
