-- nvim-treesitter `main` branch: parsers + queries only. Highlight/fold/indent
-- are wired manually via the FileType autocmd below.
return {
  "nvim-treesitter/nvim-treesitter",
  name = "nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    vim.filetype.add({ extension = { j2 = "htmldjango" } })

    local ensure_installed = {
      "python",
      "markdown", "markdown_inline", "yaml", "csv",
    }
    local installed = require("nvim-treesitter").get_installed("parsers")
    local to_install = vim.iter(ensure_installed)
        :filter(function(lang) return not vim.tbl_contains(installed, lang) end)
        :totable()
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if vim.g.vscode then return end
        if not pcall(vim.treesitter.start, args.buf) then return end
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldlevel = 99
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
