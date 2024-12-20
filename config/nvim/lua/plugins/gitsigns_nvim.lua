return {
  "lewis6991/gitsigns.nvim",
  name = "gitsigns.nvim",
  lazy = false,
  config = function()
    -- Always show the signcolumn
    vim.wo.signcolumn = "yes"
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map(
          "n",
          "<Leader>gn",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gs.nav_hunk('next')
            end
          end
        )

        map(
          "n",
          "<Leader>gN",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gs.nav_hunk('prev')
            end
          end
        )

        -- Actions
        map("n", "<leader>gu", gs.reset_hunk)
        map("n", "<leader>ga", gs.stage_hunk)
        map("v", "<leader>ga", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
        map("v", "<leader>gu", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)
        map("n", "<leader>gs", gs.stage_buffer)
        map("n", "<leader>gA", gs.undo_stage_hunk)
        map("n", "<leader>gR", gs.reset_buffer)
        map("n", "<leader>gp", gs.preview_hunk)
        map("n", "<leader>gbb", function() gs.blame_line { full = true } end)
        map("n", "<leader>gbt", gs.toggle_current_line_blame)
        -- map("n", "<leader>gd", gs.diffthis)
        -- map("n", "<leader>hD", function() gs.diffthis("~") end)
        -- map("n", "<leader>td", gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    })
  end
}
