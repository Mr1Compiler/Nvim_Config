
return require('packer').startup(function()
  -- Auto completion
  -- use {'neoclide/coc.nvim', branch = 'release'}

  -- Lua line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Install nvim-web-devicons (icon support for Neovim)
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-web-devicons'.setup {
        -- You can change settings here, but the defaults should work
      }
    end
  }

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Add Bufferline plugin
  
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Telescope for fuzzy searching
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Themes
  use 'morhetz/gruvbox'

  -- Treesitter for syntax highlighting and more
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- New ones: LSP, CMP, Snippets, and more

  use 'hrsh7th/nvim-compe'
  -- LSP configuration and helpers
  use 'neovim/nvim-lspconfig'        -- LSP support
  use 'williamboman/mason.nvim'      -- For managing LSP installations
  use 'williamboman/mason-lspconfig.nvim' -- Automatically installs LSPs
  use 'hrsh7th/nvim-cmp'             -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'         -- LSP completion source
  use 'hrsh7th/cmp-buffer'           -- Buffer completion
  use 'hrsh7th/cmp-path'             -- Path completion
  use 'L3MON4D3/LuaSnip'             -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'     -- Snippet completion
  use 'onsails/lspkind.nvim'         -- Icons for completion

  -- Code formatter
  use 'sbdchd/neoformat'

  -- Other plugins
  use 'preservim/nerdtree'           -- File Explorer
  use 'ryanoasis/vim-devicons'
  use 'mfussenegger/nvim-dap'        -- Debugger integration
  use 'junegunn/fzf'                 -- Fuzzy finder
  use 'junegunn/fzf.vim'             -- FZF vim bindings

  -- Automatically install missing plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

