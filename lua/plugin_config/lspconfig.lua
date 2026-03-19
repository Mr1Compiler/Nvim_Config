-- Using new nvim 0.11 vim.lsp.config API instead of require('lspconfig')

-- C/C++ LSP setup using clangd
vim.lsp.config.clangd = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "CMakeLists.txt", ".git" },
}
vim.lsp.enable("clangd")


vim.lsp.config.lua_ls = {
  cmd = {
    "/home/mr1compiler/lua-language-server/bin/lua-language-server",
    "-E",
    "/home/mr1compiler/lua-language-server/bin/main.lua",
  },
  filetypes = { "lua" },
  root_markers = { ".git", ".luarc.json" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}
vim.lsp.enable("lua_ls")


-- JavaScript & TypeScript LSP
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  settings = {
    javascript = { format = { enable = true } },
    typescript = { format = { enable = true } },
  }
}
vim.lsp.enable("ts_ls")

-- Python LSP
vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
vim.lsp.enable("pyright")

-- Rust LSP
vim.lsp.config.rust_analyzer = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}
vim.lsp.enable("rust_analyzer")
