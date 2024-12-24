-- See git commit message for current line with <Leader>gm
return {
  "rhysd/git-messenger.vim",
  config = function()
    vim.g.git_messenger_no_default_mappings = true
  end,
  keys = {
    { "<leader>gm", "<Plug>(git-messenger)" },
  },
}
