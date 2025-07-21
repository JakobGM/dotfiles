return {
  "neovim/nvim-lspconfig",
  name = "nvim-lspconfig",
  lazy = false,
  dependencies = {
    {
      "williamboman/mason.nvim",
      name = "mason.nvim",
      lazy = false,
      config = function()
        require("mason").setup({
          -- Options for mason.nvim
        })
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup {
          ensure_installed = {
            "postgres_lsp",
            "awk_ls",
            "basedpyright",
            "bashls",
            "cssls",
            "docker_compose_language_service",
            "dockerls",
            "grammarly",
            "graphql",
            "html",
            "jsonls",
            "lua_ls",
            "ruff",
            "rust_analyzer",
            "tailwindcss",
            "ts_ls",
            "vimls",
            "yamlls",
          },
          automatic_enable = false,
        }
      end,
    },
    {
      "nvimtools/none-ls.nvim",
      name = "none-ls.nvim",
      opts = true,
    },
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "mason.nvim",
        "none-ls.nvim",
      },
      opts = {
        ensure_installed = {
          "prettierd",
        },
        automatic_istallation = true,
      },
    },
    {
      -- Better configuration of the lua_ls language server
      "neodev.nvim",
    },
    {
      "rafamadriz/friendly-snippets",
      dependencies = {
        "hrsh7th/vim-vsnip",
      },
      config = function()
        vim.g.vsnip_filetypes.python = { "django" }
      end
    },
  },
  config = function()
    -- Workaround for: https://github.com/neovim/neovim/issues/23291
    -- Source: https://github.com/neovim/neovim/issues/23725#issuecomment-1561364086
    local ok, wf = pcall(require, "vim.lsp._watchfiles")
    if ok then
      -- disable lsp watcher. Too slow on linux
      wf._watchfunc = function()
        return function() end
      end
    end

    -- Setup Python LSP servers
    local lspconfig = require('lspconfig')

    lspconfig.basedpyright.setup({
      settings = {
        basedpyright = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
            autoImportCompletion = true,
          },
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = 'workspace',
            useLibraryCodeForTypes = true,
            typeCheckingMode = 'off'
          }
        }
      },
      capabilities = (function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        return capabilities
      end)(),
    })

    lspconfig.ruff.setup({
      on_attach = function(client, bufnr)
        -- Disable capabilities that basedpyright should handle
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.documentSymbolProvider = false
      end
    })

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        -- vim.keymap.set('n', '<Leader>d', vim.lsp.buf.declaration, opts) -- See fzf_lua.lua
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- See fzf_lua.lua
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gtD', vim.lsp.buf.type_definition, opts)
        vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- See fzf_lua.lua
        vim.keymap.set('n', '<Leader>f', function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.fixAll" },
            },
          })
        end, opts)
      end,
    })

    -- local signs = {
    --   Error = "❌",
    --   Warn = "⚠",
    --   Hint = "💡",
    --   Info = "ℹ️",
    -- }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = "", texthl = "", numhl = "" })
    -- end
    -- Disable signs in gutter showing diagnostic errors
    vim.diagnostic.config({
      virtual_text = true,
      signs = false,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    })
  end
}
