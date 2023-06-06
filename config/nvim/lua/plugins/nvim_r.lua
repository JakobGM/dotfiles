-- Adds lots of Rlang-support
return {
    "jalvesaq/Nvim-R",
    config = function()
        -- Disable replacing underscore with '->'
        vim.g.R_assign_map = '<M-->'
        vim.g.R_assign = 0

        -- Enable the use of library(colorout) for colorized R terminals
        vim.g.R_in_buffer = 1

        -- R output is highlighted with current colorscheme
        vim.g.rout_follow_colorscheme = 1

        -- R commands in R output are highlighted
        vim.g.Rout_more_colors = 1

        -- Enable SyncTeX support
        vim.g.R_synctex = 1

        -- Uncomment if you want to use tmux + kitty for R REPL
        -- let R_in_buffer = 0
        -- let R_in_buffer = 0
        -- let R_term = 'kitty'
        -- let R_term_cmd = 'kitty --title Nvim-R --name Nvim-R --instance-group Nvim-R'
    end,
}
