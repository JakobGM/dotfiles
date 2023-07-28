-- Modal git editing with <leader>g
return {
  "jreybert/vimagit",
  config = function()
    -- Enable deletion of untracked files in Magit
    vim.g.magit_discard_untracked_do_delete = 1
  end,
  keys = {
    -- Open magit status
    { "<leader>gg", "<cmd>Magit<CR>" },
    { "<leader>gp", "<cmd>!git push<CR>" },
  },
}
