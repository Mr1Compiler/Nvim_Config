-- lualine.lua

require('lualine').setup {
  options = {
    theme = 'gruvbox',  -- You can change the theme to whatever you prefer
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {'mode'},  -- Mode section (e.g., Normal, Insert)
    lualine_b = {'branch'},  -- Git branch
    lualine_c = {'filename'},  -- File name
    lualine_x = {'filetype'},  -- File type (e.g., lua, python)
    lualine_y = {'progress'},  -- Progress in the file (line/total lines)
    lualine_z = {'location'},  -- Line number and column
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
  extensions = {'fugitive'}  -- This is optional, add extensions you want
}
