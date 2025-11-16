return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    max_threads = 24,
    -- Synchronize index upon startup.
    lazy_sync = false,
    -- Fill the entire screen with results.
    layout = {
      prompt_position = "top",
      height = 1.0,
      width = 1.0,
    },
    preview = {
      -- This should hide the file info box in the preview pane,
      -- but doesn't seem to work.
      show_file_info = true,
    },
    keymaps = {
      close = "<C-c>",
    },
    debug = {
      enabled = false,
      show_scores = true,
    },
  },
  -- This plugin initializes itself lazily.
  lazy = false,
  keys = {
    {
      "<Leader><Leader>",
      function() require('fff').find_files() end,
      desc = 'FFFind files',
    }
  }
}
