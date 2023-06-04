vim.g.python3_host_prog = os.getenv("XDG_CONFIG_HOME") .. "/nvim/.venv/bin/python"

require("plugins")
require("colors")
require("formatting")
require("keymaps")
require("visual")
require("performance")
require("behavior")
