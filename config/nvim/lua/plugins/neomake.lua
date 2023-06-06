-- Linting latex documents
return {
    "neomake/neomake",
    ft = { "latex", "tex", "plaintex" },
    config = function()
        -- Use same icons as coc-settings.json
        vim.g.neomake_warning_sign = {
            text = "",
            texthl = "WarningMsg",
        }
        vim.g.neomake_error_sign = {
            text = "",
            texthl = "ErrorMsg",
        }
    end,
    keys = {
        -- Run neomake
        { "<leader>m", "<cmd>Neomake<CR>" },
    },
}
