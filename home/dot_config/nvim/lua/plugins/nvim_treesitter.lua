-- nvim-treesitter `main` branch: parsers + queries only. Highlight/fold/indent
-- are wired manually via the FileType autocmd below.
return {
  "nvim-treesitter/nvim-treesitter",
  name = "nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Custom dbt parser sourced from a local Jinja2 grammar checkout. Kept out
    -- of ensure_installed because ~/dev/tree-sitter-jinja2 isn't always cloned;
    -- run `:TSInstall dbt` once the repo is present.
    require("nvim-treesitter.parsers").dbt = {
      install_info = {
        path = "~/dev/tree-sitter-jinja2",
      },
    }
    vim.treesitter.language.register("dbt", "sql.jinja")
    vim.filetype.add({ extension = { j2 = "htmldjango" } })

    local ensure_installed = {
      "python", "rust",
      "markdown", "markdown_inline", "r", "rnoweb", "yaml", "latex", "csv",
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
