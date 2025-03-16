vim.cmd('syntax on')

vim.wo.number = true
vim.wo.relativenumber = true

-- Set background to dark
vim.o.background = 'dark'

-- Enable mouse support
vim.o.mouse = 'a'

-- Map 'jj' to escape in insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Set tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- vim.cmd([[
--   augroup C_CPP_Indent
--     autocmd!
--     autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab
--   augroup END
-- ]])
