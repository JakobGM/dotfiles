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
            "efm",
            "grammarly",
            "graphql",
            "html",
            "jsonls",
            "lua_ls",
            "pyright",
            "ruff_lsp",
            "rust_analyzer",
            "sqlls",
            "tailwindcss",
            "tsserver",
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
        "jose-elias-alvarez/null-ls.nvim",
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
    {
      "elentok/format-on-save.nvim",
      config = function()
        local format_on_save = require("format-on-save")
        local formatters = require("format-on-save.formatters")

        format_on_save.setup({
          auto_commands = true,
          user_commands = true,

          partial_update = true,

          exclude_path_patterns = {
            "/node_modules/",
            ".local/share/nvim/lazy",
          },
          formatter_by_ft = {
            css = formatters.lsp,
            html = formatters.lsp,
            htmldjango = {
              formatters.shell({
                cmd = { "ci-djhtml", "%", "2>", "/dev/null" },
                tempfile = "random",
              }),
            },
            java = formatters.lsp,
            javascript = {
              formatters.lsp,
              formatters.prettierd,
            },
            json = {
              formatters.lsp,
              formatters.prettierd,
            },
            lua = formatters.lsp,
            markdown = formatters.prettierd,
            openscad = formatters.lsp,
            python = {
              formatters.remove_trailing_whitespace,
              formatters.shell({
                cmd = {
                  "ruff",
                  "check",
                  "--stdin-filename",
                  "%",
                  -- Do not print errors to STDERR
                  "--fix-only",
                  -- Only perform import sorting
                  "--select",
                  "I",
                  "-",
                },
              }),
              formatters.black,
            },
            rust = formatters.lsp,
            scad = formatters.lsp,
            scss = formatters.lsp,
            sh = formatters.shfmt,
            terraform = formatters.lsp,
            typescript = formatters.prettierd,
            typescriptreact = formatters.prettierd,
            yaml = {
              formatters.lsp,
              formatters.prettierd,
            },
          },

          -- Optional: fallback formatter to use when no formatters match the current filetype
          fallback_formatter = {
            formatters.remove_trailing_whitespace,
          },

          -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
          -- To prevent that set `run_with_sh` to `false`.
          run_with_sh = false,
        })
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

    -- Setup language servers.
    local lspconfig = require('lspconfig')
    lspconfig.awk_ls.setup({})
    lspconfig.bashls.setup({})
    lspconfig.cssls.setup({})
    lspconfig.docker_compose_language_service.setup({})
    lspconfig.dockerls.setup({})
    lspconfig.efm.setup({})
    lspconfig.grammarly.setup({})
    lspconfig.graphql.setup({})
    lspconfig.html.setup({})
    lspconfig.jsonls.setup({})
    lspconfig.lua_ls.setup({
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
        pyright = { autoImportCompletion = true, },
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
    lspconfig.ruff_lsp.setup({
      on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end
    })
    lspconfig.rust_analyzer.setup({})
    lspconfig.sqlls.setup({})
    lspconfig.tailwindcss.setup({})
    lspconfig.tsserver.setup({})
    lspconfig.vimls.setup({})
    lspconfig.yamlls.setup({})

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
        vim.keymap.set('n', '<Leader>d', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
        vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
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
