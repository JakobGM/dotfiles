-- Asynchronous file/tags searcher
return {
    "ibhagwan/fzf-lua",
    dependencies = {
        {
            "junegunn/fzf",
            build = function()
                vim.fn["fzf#install"]()
            end,
        },
        -- Optional for icon support
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        vim.g.fzf_action = {
            ["ctrl-t"] = "tab split",
            ["ctrl-s"] = "split",
            ["ctrl-v"] = "vsplit",
        }
        -- [Buffers] Jump to the existing window if possible
        vim.g.fzf_buffers_jump = 1
    end,

    keys = {
        -- All files in project
        { "<leader><space>", function() require("fzf-lua").files() end },
        -- All tags in current buffer
        { "<leader>T",       function() require("fzf-lua").btags() end },
        -- All tags in project
        { "<leader>t",       function() require("fzf-lua").tags() end },
        -- Command
        { "<leader>:",       function() require("fzf-lua").commands() end },
        -- All git commits
        { "<leader>gl",      function() require("fzf-lua").git_commits() end },
        -- All git commits in current buffer
        { "<leader>gL",      function() require("fzf-lua").git_bcommits() end },
        -- Grep content of all files
        { "<leader>/",       function() require("fzf-lua").live_grep() end },
        -- Search normal mode mappings
        { "<leader><Esc>",   function() require("fzf-lua").keymaps() end },
        -- Search helptags
        { "<leader>hh",      function() require("fzf-lua").help_tags() end },
    }
}