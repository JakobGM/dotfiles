return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap_python = require("dap-python")
    dap_python.setup(".venv/bin/python")
    dap_python.test_runner = "pytest"
  end,
}
