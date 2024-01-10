-- Adds comment action with 'gc'
return {
  "terrortylor/nvim-comment",
  lazy = false,
  cmd = "CommentToggle",
  config = function()
    require('nvim_comment').setup({
      line_mapping = "<leader>cc",
      operator_mapping = "gc",
    })
  end
}
