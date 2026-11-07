-- Winbar with the file path and the symbols around the cursor (class, method, ...),
-- from LSP or treesitter. Click a part, or use the picker, to jump to a sibling.
return {
  "Bekaboo/dropbar.nvim",
  -- Load at startup so the winbar shows up without pressing the mapping first
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    icons = {
      kinds = {
        -- No folder icons: a path part without an icon is a folder
        dir_icon = "",
      },
    },
  },
  config = function(_, opts)
    require("dropbar").setup(opts)

    -- Many colorschemes don't define WinBar, so Neovim's default (a near-black
    -- background) shows. Without a background the winbar uses the window's
    -- Normal background, whatever the colorscheme.
    local function clear_winbar_background()
      for _, group in ipairs({ "WinBar", "WinBarNC" }) do
        local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
        hl.bg, hl.ctermbg = nil, nil
        vim.api.nvim_set_hl(0, group, hl)
      end
    end
    clear_winbar_background()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("DropbarBackground", { clear = true }),
      callback = clear_winbar_background,
    })
  end,
  keys = {
    { "<leader>;", function() require("dropbar.api").pick() end, desc = "Pick a winbar symbol" },
  },
}
