-- Enable syntax highlighting
vim.cmd('syntax on')

-- Set number and relative number
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

-- Install packer if not installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if not vim.loop.fs_stat(install_path) then
  vim.fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end
vim.cmd('packadd packer.nvim')

-- Use packer to manage plugins
require('packer').startup(function()
  -- Auto completion
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Themes
  use 'morhetz/gruvbox'

  -- Other plugins
  use 'preservim/nerdtree'
  use 'neovim/nvim-lspconfig'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'mfussenegger/nvim-dap'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
end)

-- Map <C-n> to toggle NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

--Requiring coc.lua
require('lsp.coc')

-- Set the colorscheme
vim.cmd('colorscheme gruvbox')
