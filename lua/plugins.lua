return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Icons
 use 'nvim-tree/nvim-web-devicons' 

  -- Comments
  use 'numToStr/Comment.nvim'

  -- UI Enhancements
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- Omnisharp extension
  use 'Hoffs/omnisharp-extended-lsp.nvim'
  
  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- Telescope for fuzzy searching
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Treesitter for syntax highlighting and more
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP, Autocompletion & Snippets
  use 'neovim/nvim-lspconfig'            -- LSP support
  use 'williamboman/mason.nvim'          -- LSP manager
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'                 -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'             -- LSP completion source
  use 'hrsh7th/cmp-buffer'               -- Buffer completion
  use 'hrsh7th/cmp-path'                 -- Path completion
  use 'L3MON4D3/LuaSnip'                 -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'         -- Snippet completion
  use 'onsails/lspkind.nvim'             -- Icons for completion

  -- Code Formatter
  use 'sbdchd/neoformat'

  -- File Explorer
  --use 'preservim/nerdtree'
use {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  }
}


  -- Debugging
  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    }
  }
  use 'theHamsta/nvim-dap-virtual-text'

  -- Fuzzy Finder
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Theme
  --use 'morhetz/gruvbox'
   use "rebelot/kanagawa.nvim"

  -- Automatically install missing plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
