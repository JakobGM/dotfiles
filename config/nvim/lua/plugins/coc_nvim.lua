-- Autocompletion framework
return {
  "neoclide/coc.nvim",
  lazy = false,
  branch = "release",
  config = function()
    -- Extensions need to be installed at first startup
    vim.g.coc_global_extensions = {
      "@yaegassy/coc-ruff",
      "@yaegassy/coc-tailwindcss3",
      "coc-css",
      "coc-highlight",
      "coc-html",
      "coc-htmldjango",
      "coc-json",
      "coc-pyright",
      "coc-r-lsp",
      "coc-rust-analyzer",
      "coc-snippets",
      "coc-spell-checker",
      "coc-sumneko-lua",
      "coc-vimlsp",
    }

    -- Tweak insert mode completion
    --   noinsert: Do not insert text before accepting the completion
    --   menuone: Use the popup menu even if there is only one match
    --   noselect: Do not select a match in the menu, force manual selection
    vim.o.completeopt = "noinsert,menuone,noselect"

    -- Snippet expand and additional edit feature of LSP requires confirm completion to work.
    vim.o.confirm = true

    -- Do not show in-completion-menu messages, e.g. 'match 1 of 2'
    vim.o.shortmess = vim.o.shortmess .. "c"

    -- Update sign column every quarter second
    vim.o.updatetime = 300

    -- Some servers have issues with backup files, see #649
    vim.o.backup = false
    vim.o.writebackup = false

    -- Enable coc-htmldjango for Jinja2 HTML templates
    -- Equivalent to: vim.api.nvim_command("autocmd BufNewFile,BufRead *.j2 setfiletype htmldjango")
    vim.api.nvim_create_autocmd(
      { "BufNewFile", "BufRead" },
      {
        pattern = "*.j2",
        callback = function()
          vim.bo.filetype = "htmldjango"
        end,
      }
    )

    -- Highlight symbol under cursor on CursorHold
    vim.api.nvim_create_autocmd(
      { "CursorHold" },
      {
        pattern = "*",
        callback = function()
          vim.fn.CocActionAsync("highlight")
        end,
      }
    )

    -- :Format command
    vim.api.nvim_create_user_command(
      "Format",
      function()
        vim.fn.CocAction("format")
      end,
      {
        nargs = 0,
      }
    )
    -- :Fold command
    vim.api.nvim_create_user_command(
      "Fold",
      function(arg)
        vim.fn.CocAction("fold", arg.fargs)
      end,
      {
        nargs = "?",
      }
    )
    -- :OR command
    vim.api.nvim_create_user_command(
      "OR",
      function()
        vim.fn.CocAction("runCommand", "editor.action.organizeImport")
      end,
      {
        nargs = 0,
      }
    )

    -- coc-snippets
    -- Use tab for snippets and trigger completion with characters ahead and navigate.
    -- Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    local function check_back_space()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      return col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s") ~= nil
    end
    local function autocomplete()
      if vim.fn["coc#pum#visible"]() then
        return vim.fn["coc#_select_confirm"]()
      elseif vim.fn["coc#expandableOrJumpable"]() then
        return vim.fn["coc#rpc#request"]("doKeymap", { "snippets-expand-jump", "" })
      elseif check_back_space() then
        return api.nvim_replace_termcodes("<Tab>", true, true, true)
      else
        return vim.fn["coc#refresh"]()
      end
    end
    vim.api.nvim_create_user_command(
      "CocAutocomplete",
      autocomplete,
      {
        nargs = 0,
      }
    )
    vim.g.coc_snippet_next = "<tab>"
  end,
  keys = {
    -- Escape completion with ctrl+c
    { "<C-c>",      "<ESC>",                                      mode = "i" },

    -- Navigate diagnostics
    { "<leader>en", "<Plug>(coc-diagnostic-prev)" },
    { "<leader>eN", "<Plug>(coc-diagnostic-next)" },

    -- Go to definition
    { "<leader>d",  "<Plug>(coc-definition)" },

    -- Remap keys for gotos
    { "gy",         "<Plug>(coc-type-definition)" },
    { "<leader>R",  "<Plug>(coc-references)" },

    -- Use K to show documentation
    { "K",          "<cmd>lua vim.fn['CocAction']('doHover')<CR>" },

    -- Remap for rename current word
    { "<leader>r",  "<Plug>(coc-rename)" },

    -- Remap for format selected region
    { "<leader>f",  "<Plug>(coc-format-selected)" },

    -- Remap for do codeAction of selected region
    { "<leader>a",  "<Plug>(coc-codeaction-selected)",            mode = "v" },

    -- Remap for do codeAction of current line
    { "<leader>ac", "<Plug>(coc-codeaction)" },

    -- Fix autofix problem of current line
    { "<leader>Q",  "<Plug>(coc-fix-current)" },

    -- Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-pyright
    { "<TAB>",      "<Plug>(coc-range-select)",                   mode = { "n", "x" } },
    { "<S-TAB>",    "<Plug>(coc-range-select-backword)",          mode = "x" },

    -- Use `:Format` to format current buffer
    { "<leader>F",  ":Format<CR>" },

    -- Use `:Fold` to fold current buffer
    { "<leader>F",  ":Fold<CR>" },

    -- use `:OR` for organize import of current buffer
    { "<leader>OR", ":OR<CR>" },

    -- Using CocList
    -- Show all diagnostics
    { "<leader>cd", ":CocList diagnostics<CR>" },

    -- Manage extensions
    { "<leader>ce", ":CocList extensions<CR>" },

    -- Show commands
    { "<leader>cc", ":CocList commands<CR>" },

    -- Find symbol of current document
    { "<leader>S",  ":CocList outline<CR>" },

    -- Search workspace symbols
    { "<leader>s",  ":CocList -I symbols<CR>" },

    -- Do default action for next item.
    { "<leader>cj", ":CocNext<CR>" },

    -- Do default action for previous item.
    { "<leader>ck", ":CocPrev<CR>" },

    -- Resume latest coc list
    { "<leader>cl", ":CocListResume<CR>" },

    -- coc-snippets
    { "<TAB>",      vim.F.CocAutocomplete,                        mode = "i" },
    -- Edit UltiSnips snippets for the current file
    { "leader>us",  ":CocCommand snippets.editSnippets<CR>" },
  },
}
