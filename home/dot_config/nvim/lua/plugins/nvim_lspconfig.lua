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
            "tombi",
            "ts_ls",
            "vimls",
            "yamlls",
          },
          automatic_enable = false,
        }
      end,
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

    -- Configure LSP servers using nvim-0.11 API
    vim.lsp.config.basedpyright = {
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
    }

    vim.lsp.config.ruff = {
      on_attach = function(client, bufnr)
        -- Disable capabilities that basedpyright should handle
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.documentSymbolProvider = false
      end
    }

    vim.lsp.config.tailwindcss = {
      filetypes = { "htmldjango", "python" },
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              -- htpy: class_="px-1" or class_=[foo, "px-1"] on a single line
              "class_=[^\"]*\"([^\"]*)\"",
              -- htpy: class_=[\n"px-1",\n] on multiple lines
              "\\s+\"([^\"]*)\",",
              -- htpy: class_=[\n{"px-1": bool},\n] on multiple lines
              "\\s+\\{\"([^\"]*)\":\\s[^\\}]*\\},",
              -- Custom component default args
              "_class: str = \"([^\"]*)\",",
              -- Variables and custom component args
              "_class\\s?=\\s?\"([^\"]*)\""
            },
          },
        },
      },
    }

    -- Enable configured LSP servers
    vim.lsp.enable({
      'basedpyright',
      'ruff',
      'tailwindcss',
      'tombi',
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
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gtD', vim.lsp.buf.type_definition, opts)
        vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
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
