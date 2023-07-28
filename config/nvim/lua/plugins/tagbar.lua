-- Open tag navigation split with :Tagbar
return {
  "majutsushi/tagbar",
  cmd = "Tagbar",
  config = function()
    -- Open Tagbar to the right
    vim.g.tagbar_left = 0

    -- Sort tags according to their location in the source file
    vim.g.tagbar_sort = 0

    -- Only use on space for indent, saving horizontal real estate
    vim.g.tagbar_indent = 1

    -- Do not show public/private icons, as it is somewhat irrelevant in python
    vim.g.tagbar_show_visibility = 0

    -- Use fontawesome chevrons for hierarchy icons
    vim.g.tagbar_iconchars = { "", "" }
  end
}
