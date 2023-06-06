-- Integration with the pandoc document converter
return {
    "vim-pandoc/vim-pandoc",
    config = function()
        -- Disable folding of sections and automatic directory change
        vim.g["pandoc#syntax#conceal#use"] = 0
        vim.g["pandoc#modules#disabled"] = { "folding", "chdir" }
    end,
}
