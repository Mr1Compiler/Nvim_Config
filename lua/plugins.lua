require('packer').startup(function()
  -- Auto completion
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Themes
  use 'morhetz/gruvbox'

  -- Other plugins
  use 'preservim/nerdtree'
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-dap'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
end)
