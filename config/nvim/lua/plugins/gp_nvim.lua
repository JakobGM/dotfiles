return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      -- If missing, run the following command:
      -- op read op://Personal/fset4nvw2l6tvbufg6uovpty5e/api-key > ~/.config/chatgpt/secret.key
      openai_api_key = { "cat", "/home/jakobgm/.config/chatgpt/secret.key" },
      chat_user_prefix = "💬:",
      chat_conceal_model_params = false,
    })
  end,
  keys = {
    -- Invoke the GpChatToggle command
    { "<C-g>t", ":GpChatToggle<CR>",    mode = { "n", "v" } },
    { "<C-g>n", ":GpChatNew<CR>",       mode = { "n", "v" } },
    { "<C-g>r", ":GpRewrite<CR>",       mode = { "v" } },
    { "<C-g>a", ":GpAppend<CR>",        mode = { "v" } },
    { "<C-g>d", "<cmd>GpChatDelete<CR>" },
    { "<C-g>f", "<cmd>GpChatFinder<CR>" },
  },
}
