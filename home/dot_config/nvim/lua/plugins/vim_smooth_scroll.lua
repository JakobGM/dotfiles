-- Smooth scroll animation instead of jump
return {
  "cskeeters/vim-smooth-scroll",
  config = function()
    -- Make the scroll animation twice as fast (default 8 ms)
    vim.g.ms_per_line = 4
  end,
}
