require("lazy").setup({
  -- Go development
  "ray-x/go.nvim",
  "leoluz/nvim-dap-go",

  -- Icons
  "nvim-tree/nvim-web-devicons",

  -- Comments
  "numToStr/Comment.nvim",

  -- UI Enhancements
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Omnisharp extension
  "Hoffs/omnisharp-extended-lsp.nvim",

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("plugin_config.treesitter")
    end,
  },

  -- LSP, Autocompletion & Snippets
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind.nvim",

  -- Code Formatter
  "sbdchd/neoformat",

  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  "theHamsta/nvim-dap-virtual-text",

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = true,
              check = {
                command = "clippy",
              },
              diagnostics = {
                enable = true,
                styleLints = {
                  enable = true,
                },
              },
            },
          },
        },
      }
    end,
  },

  -- Themes
  "rebelot/kanagawa.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  "folke/tokyonight.nvim",
  "rose-pine/neovim",
  "EdenEast/nightfox.nvim",
  "navarasu/onedark.nvim",
})
