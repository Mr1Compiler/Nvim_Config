

-- Bufferline Configuration
require('bufferline').setup {
  options = {
    numbers = "none",
    close_command = "bdelete! %d",  -- close current buffer
    right_mouse_command = "bdelete! %d",  -- close buffer with right-click
    left_mouse_command = "buffer %d",  -- switch buffer
    middle_mouse_command = "bdelete! %d", -- close buffer with middle-click
    indicator = {
      icon = "▎",
      style = "icon"
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NERDTree",   -- Check for NERDTree filetype
        text = "NERDTree",       -- Label above NERDTree buffer
        highlight = "Directory", -- Optional: you can define a highlight group
        padding = 1              -- Add padding around the label
      },
    },
  }
}


