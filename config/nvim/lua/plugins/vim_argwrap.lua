-- Wrap function arguments with <leader>a
return {
    "fooSoft/vim-argwrap",
    keys = {
        -- Wrap function arguments
        { "<leader>a", "<cmd>ArgWrap<cr>" },
    },
    config = function()
        -- Use trailing comma on last argument
        vim.g.argwrap_tail_comma = 1
    end,
}
