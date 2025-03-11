require'lspconfig'.csharp_ls.setup{
  cmd = { "/home/mr1compiler/.dotnet/tools/csharp-ls", "--loglevel", "info" },
  filetypes = { "cs" },
  root_dir = function(fname)
    return vim.fn.getcwd()  -- Or a custom root path
  end,
}
