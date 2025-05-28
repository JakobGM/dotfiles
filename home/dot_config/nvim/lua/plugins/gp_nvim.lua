return {
  -- Requires sox and twolame for the :GpWhisper command
  "robitx/gp.nvim",
  config = function()
    local conf = {
      providers = {
        openai = {
          secret = {
            "op",
            "--account=crdbrd.1password.com",
            "read",
            "op://Employee/up54ftsb5dpovvttkijlx2k7cq/api-key",
          },
        },
        anthropic = {
          secret = {
            "op",
            "--account=crdbrd.1password.com",
            "read",
            "op://Employee/Anthropic/credential",
          },
        },
      }
    }
    require("gp").setup(conf)

    local function keymapOptions(desc)
      return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
      }
    end
    vim.keymap.set({ "n", "i" }, "<C-g>ww", "<cmd>GpWhisper<cr>", keymapOptions("Whisper"))
  end,
}
