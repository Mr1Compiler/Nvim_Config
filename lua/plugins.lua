return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Icons (Only include one devicons plugin)
  use {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        default = true
      }
    end
  }


use 'numToStr/Comment.nvim'


  -- UI Enhancements
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  
  -- using packer.nvim
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Telescope for fuzzy searching
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Treesitter for syntax highlighting and more
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP, Autocompletion & Snippets
  use 'neovim/nvim-lspconfig'        -- LSP support
  use 'williamboman/mason.nvim'      -- LSP manager
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'             -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'         -- LSP completion source
  use 'hrsh7th/cmp-buffer'           -- Buffer completion
  use 'hrsh7th/cmp-path'             -- Path completion
  use 'L3MON4D3/LuaSnip'             -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'     -- Snippet completion
  use 'onsails/lspkind.nvim'         -- Icons for completion

  -- Code Formatter
  use 'sbdchd/neoformat'

  -- File Explorer
  use 'preservim/nerdtree'

  -- Debugging
  use 'mfussenegger/nvim-dap'        -- Debugger integration

  -- Fuzzy Finder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Theme
  use 'morhetz/gruvbox'

  -- Automatically install missing plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

