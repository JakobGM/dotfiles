return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      openai_api_key = { "op", "read", "op://Personal/fset4nvw2l6tvbufg6uovpty5e/api-key", "--no-newline" },
    })
  end,
}
