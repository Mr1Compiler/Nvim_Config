require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "lua", "javascript", "html", "css" },  -- List of languages
  highlight = {
    enable = true,  -- Enable Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false,
  },
}
