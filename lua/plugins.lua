require('packer').startup(function()
  -- Auto completion
  use {'neoclide/coc.nvim', branch = 'release'}

  -- Lua line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}


  -- Themes
  use 'morhetz/gruvbox'
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
}

  --new ones

    use 'neovim/nvim-lspconfig'        -- LSP support
    use 'hrsh7th/nvim-cmp'             -- Completion engine
    use 'hrsh7th/cmp-nvim-lsp'         -- LSP completion source
    use 'hrsh7th/cmp-buffer'           -- Buffer completion
    use 'hrsh7th/cmp-path'             -- Path completion
    use 'L3MON4D3/LuaSnip'             -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip'     -- Snippet completion
    use 'onsails/lspkind.nvim'         -- Icons for completion:


  -- Code formatter
  use 'sbdchd/neoformat'


  -- Other plugins
  use 'preservim/nerdtree'
  use 'mfussenegger/nvim-dap'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- Automatically install missing plugins
  if packer_bootstrap then
      require('packer').sync()
  end
end)
