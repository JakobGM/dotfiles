-- LaTeX completion
return {
  "lervag/vimtex",
  ft = { "tex", "latex", "bib" },
  config = function()
    -- Enable vimtex for all .tex files
    vim.g.tex_flavor = "latex"

    -- Use zathura as the PDF reader of choice
    vim.g.vimtex_view_method = "zathura"

    -- New Lua implementation:
    vim.g.vimtex_compiler_latexmk = {
      backend = "nvim",
      background = 1,
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-pdflatex=lualatex",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
  end,
}
