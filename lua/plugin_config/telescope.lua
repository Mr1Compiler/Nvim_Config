require('telescope').setup {
  defaults = {
    file_ignore_patterns = {"node_modules", ".git"},  -- Ignore directories you don't want to search
  },
  mappings = {  -- Normal mode keymaps
    n = {
      ['q'] = require('telescope.actions').close,  -- Correctly binding 'q' to close Telescope
    },
  },
}
