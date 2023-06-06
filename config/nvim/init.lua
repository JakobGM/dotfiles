vim.g.python3_host_prog = os.getenv("XDG_CONFIG_HOME") .. "/nvim/.venv/bin/python"

-- Set the global and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy_bootstrap")
require("lazy").setup("plugins")
require("formatting")
require("keymaps")
require("visual")
require("performance")
require("behavior")
