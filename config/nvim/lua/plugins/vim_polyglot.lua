-- Add syntax highlighting for a large range of filetypes
return {
    "sheerun/vim-polyglot",
    config = function()
        vim.g.polyglot_disabled = { "latex", "python" }
    end,
}
