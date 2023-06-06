-- Show test coverage in sign gutter
return {
    "andythigpen/nvim-coverage",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = {
        "Coverage",
        "CoverageClear",
        "CoverageHide",
        "CoverageLoad",
        "CoverageLoadLcov",
        "CoverageShow",
        "CoverageSummary",
        "CoverageToggle",
    },
    config = function()
        require("coverage").setup({
            auto_reload = true,
            commands = true, -- create commands
            highlights = {
                -- customize highlight groups created by the plugin
                covered = { fg = "#B7F071" }, -- supports style, fg, bg, sp (see :h highlight-gui)
                uncovered = { fg = "#F07178" },
                partial = { fg = "#AA71F0" },
            },
            signs = {
                -- use your own highlight groups or text markers
                covered = { hl = "CoverageCovered", text = "▎" },
                uncovered = { hl = "CoverageUncovered", text = "▎" },
                partial = { hl = "CoveragePartial", text = "▎" },
            },
            summary = {
                -- customize the summary pop-up
                min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
            },
            lang = {
                -- customize language specific settings
                python = {
                    coverage_file = "coverage.xml",
                },
            },
            load_coverage_cb = function(ftype)
                vim.notify("Loaded " .. ftype .. " coverage")
            end,
        })
    end,
}
