-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = {"c", "c_sharp" ,"cpp", "python", "lua", "javascript", "html", "css" },  -- List of languages
--   highlight = {
--     enable = true,  -- Enable Treesitter-based syntax highlighting
--     additional_vim_regex_highlighting = false,
--   },
-- }

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "c_sharp", "cpp", "python", "lua", "javascript", "html", "css" },  -- List of languages
  sync_install = false,  -- Install parsers asynchronously
  auto_install = true,  -- Automatically install missing parsers

  highlight = {
    enable = true,  -- Enable Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false,  -- Set to true if you experience issues
  },

  indent = {
    enable = true,  -- Enable Treesitter-based indentation
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",  -- Start selection
      node_incremental = "grn",  -- Expand selection
      scope_incremental = "grc",
      node_decremental = "grm",  -- Shrink selection
    },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}


