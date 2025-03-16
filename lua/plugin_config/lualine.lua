require('lualine').setup {
  options = {
    theme = 'gruvbox',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},  -- Show diagnostics count (error, warning)
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  tabline = {},
  extensions = {'fugitive'}
}

