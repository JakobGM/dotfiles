return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      -- If missing, run the following command:
      -- op read op://Personal/fset4nvw2l6tvbufg6uovpty5e/api-key > ~/.config/chatgpt/secret.key
      openai_api_key = { "cat", "/home/jakobgm/.config/chatgpt/secret.key" },
    })
  end,
}
