return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    {
      "williamboman/mason.nvim",
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
          -- Options for mason-lspconfig.nvim
          ensure_installed = {
            "awk_ls",
            "bashls",
            "cssls",
            "docker_compose_language_service",
            "dockerls",
            "grammarly",
            "graphql",
            "html",
            "jsonls",
            "lua_ls",
            "pyright",
            "ruff",
            "rust_analyzer",
            "sqlls",
            "tailwindcss",
            "ts_ls",
            "vimls",
            "yamlls",
          }
        }
      end,
    },
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
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
      "folke/neodev.nvim",
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

    local lspconfig = require('lspconfig')

    -- Default on_attach function for all language servers
    on_attach = function(client, bufnr)
      -- Make <leader>w format document if available
      -- https://github.com/neovim/nvim-lspconfig/issues/1891#issuecomment-1157964108
      if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set(
          'n',
          '<Leader>w',
          function()
            vim.lsp.buf.format({ async = true })
            vim.api.nvim_command('silent write')
          end,
          { buffer = bufnr, silent = true }
        )
      end
    end

    -- Setup language servers.
    lspconfig.awk_ls.setup({ on_attach = on_attach })
    lspconfig.bashls.setup({ on_attach = on_attach })
    lspconfig.cssls.setup({ on_attach = on_attach })
    lspconfig.docker_compose_language_service.setup({ on_attach = on_attach })
    lspconfig.dockerls.setup({ on_attach = on_attach })
    lspconfig.grammarly.setup({ on_attach = on_attach })
    lspconfig.graphql.setup({ on_attach = on_attach })
    lspconfig.html.setup({ on_attach = on_attach })
    lspconfig.jsonls.setup({ on_attach = on_attach })
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          completion = {
            callSnippet = "Replace"
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
    lspconfig.pyright.setup({
      on_attach = on_attach,
      settings = {
        pyright = {
          autoImportCompletion = true,
          -- Using Ruff's import organizer
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
      -- Disable hints
      -- https://www.reddit.com/r/neovim/comments/11k5but/comment/jbjwwtf
      capabilities = (function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        return capabilities
      end)(),
    })
    lspconfig.ruff.setup({
      on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
        on_attach(client, bufnr)
      end
    })
    lspconfig.rust_analyzer.setup({ on_attach = on_attach })
    lspconfig.sqlls.setup({ on_attach = on_attach })
    lspconfig.tailwindcss.setup({ on_attach = on_attach })
    lspconfig.ts_ls.setup({ on_attach = on_attach })
    lspconfig.vimls.setup({ on_attach = on_attach })
    lspconfig.yamlls.setup({ on_attach = on_attach })

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
