-- Navigate between tmux and vim with <C>+jkhl
return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
        -- Navigate between tmux and vim
        { "<C-h>", "<cmd>TmuxNavigateLeft<CR>" },
        { "<C-j>", "<cmd>TmuxNavigateDown<CR>" },
        { "<C-k>", "<cmd>TmuxNavigateUp<CR>" },
        { "<C-l>", "<cmd>TmuxNavigateRight<CR>" },
    },
}
