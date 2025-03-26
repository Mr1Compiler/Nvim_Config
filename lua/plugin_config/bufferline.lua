
require('bufferline').setup {
  options = {
    numbers = "none",  -- No numbers, only icons
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = "bdelete! %d",
    indicator = {
      icon = "▎",
      style = "icon"
    },
    buffer_close_icon = "x", -- Correct close icon
    modified_icon = "●",  -- Correct modified file icon
    close_icon = "",  -- Fix close icon
    left_trunc_marker = "",
    right_trunc_marker = "",
    show_buffer_icons = true,  -- Make sure icons are enabled
    show_buffer_close_icons = true,
    separator_style = "slant",  -- Try different separator styles
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "nvim-tree",
        text = "Explorer",
        highlight = "Directory",
        padding = 1
      },
    },
  }
}

