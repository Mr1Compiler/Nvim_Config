local lspconfig = require('lspconfig')

-- Global diagnostics settings
vim.diagnostic.config({
  virtual_text = true,      -- Enable inline diagnostics
  signs = true,             -- Show signs in the left gutter
  update_in_insert = false, -- Disable diagnostics in Insert mode
  underline = true,         -- Underline errors and warnings
  severity_sort = true,     -- Sort diagnostics by severity
})

-- 🌐 C# LSP
lspconfig.csharp_ls.setup({
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
  settings = {
    csharp = {
      formatting = { enable = true },
      codeActions = { enable = true },
    }
  },
})

-- 🔧 C/C++ LSP
lspconfig.clangd.setup({
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
  settings = {
    clangd = {
      compilationDatabasePath = "build",
    },
  },
})

-- 🟡 Lua LSP
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" }, -- LuaJIT is used for Neovim
      diagnostics = { globals = { "vim" } }, -- Fix "vim is undefined" error
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    }
  }
})

-- 🟦 JavaScript & TypeScript LSP (Using `ts_ls` instead of `tsserver`)
lspconfig.ts_ls.setup({
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  settings = {
    javascript = { format = { enable = false } },
    typescript = { format = { enable = false } },
  }
})

-- 🌍 HTML LSP
lspconfig.html.setup({
  filetypes = { "html" },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- 🎨 CSS LSP
lspconfig.cssls.setup({
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

-- 🐍 Python LSP
lspconfig.pyright.setup({
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict", -- Enable strict type checking
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

