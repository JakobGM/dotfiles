-- Git plugin with commands 'G<command>'
return {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "GBrowse",
    "Gw",
  },
  dependencies = {
    -- Open GitHub source with :GBrowse and autocompletion for GitHub issues
    "tpope/vim-rhubarb",
    keys = {
      -- Open GitHub source
      { "<Leader>gh", "<cmd>GBrowse!<CR>:GBrowse<CR>" },
      { "<Leader>gh", "<cmd>GBrowse!<CR>gv:GBrowse<CR>", mode = "v" },
    },
  },
  keys = {
    -- Write to git staging area
    { "<Leader>gw", ":Gw<CR>" },
    -- Blame the whole file. <Leader>gb* belongs to gitsigns.
    { "<Leader>gB", "<cmd>Git blame<CR>" },
  },
}
