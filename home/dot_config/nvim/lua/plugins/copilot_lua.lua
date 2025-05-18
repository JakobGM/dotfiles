-- GitHub Copilot integration
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-h>",
        },
      },
      filetypes = {
        yaml = true,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_model = "gpt-4o-copilot",
    })
    -- Press ctrl+e to accept just a single word from the suggestion
    vim.keymap.set(
      "i",
      "<C-e>",
      function()
        require("copilot.suggestion").accept_word()
      end,
      { noremap = true }
    )
  end,
}
