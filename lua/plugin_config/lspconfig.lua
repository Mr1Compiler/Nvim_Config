
local lspconfig = require("lspconfig")
local omnisharp_extended = require("omnisharp_extended")

lspconfig.omnisharp.setup({
  cmd = { "dotnet", "/home/mr1compiler/.local/bin/omnisharp/OmniSharp.dll" },
  handlers = omnisharp_extended.handlers, -- 🔥 this enables the magic
  filetypes = { "cs" },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
  settings = {
    RoslynExtensionsOptions = {
      EnableDecompilationSupport = true,
    },
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
  },
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
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


