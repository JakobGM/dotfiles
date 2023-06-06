-- Gruvbox colorscheme
return {
    "gruvbox-community/gruvbox",
    laz = false,
    priority = 1000,
    config = function()
        require("colors")
        vim.cmd("colorscheme gruvbox")
        vim.opt.background = "dark"
    end,
}
