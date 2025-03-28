local lspconfig = require('lspconfig')

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

-- C/C++ LSP setup using clangd
lspconfig.clangd.setup({
  cmd = { "clangd" },  -- Uses the globally installed clangd
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git"),  -- Use CMake or git as root pattern
  settings = {
    clangd = {
      -- Any additional clangd settings can go here
      enable = true,
    }
  }
})

-- 🟡 Lua LSP
lspconfig.lua_ls.setup({
  cmd = { "/mnt/extraspace/Nvim_Configs/Language_servers/lua-language-server/bin/lua-language-server" },
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


