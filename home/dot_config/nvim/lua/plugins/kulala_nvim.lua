return {
  'mistweaverco/kulala.nvim',
  filetypes = { "http" },
  config = function()
    require('kulala').setup()
  end,
  keys = {
    { "<localleader>rr", function() require("kulala").run() end },
  }
}
