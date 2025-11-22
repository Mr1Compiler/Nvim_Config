-- Using new nvim 0.11 vim.lsp.config API instead of require('lspconfig')
-- local omnisharp_extended = require("omnisharp_extended")

-- lspconfig.omnisharp.setup({
--   cmd = { "dotnet", "/home/mr1compiler/.local/bin/omnisharp/OmniSharp.dll" },
--   handlers = omnisharp_extended.handlers, -- 🔥 this enables the magic
--   filetypes = { "cs" },
--   root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
--   settings = {
--     RoslynExtensionsOptions = {
--       EnableDecompilationSupport = true,
--     },
--     FormattingOptions = {
--       EnableEditorConfigSupport = true,
--       OrganizeImports = true,
--     },
--   },
-- on_attach = function(client, bufnr)
--   local opts = { noremap = true, silent = true, buffer = bufnr }
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--   vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
--   vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- 🆕
-- end
-- })





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





-- 🟡 OLD Lua LSP
-- lspconfig.lua_ls.setup({
--   cmd = { "/mnt/extraspace/Nvim_Configs/Language_servers/lua-language-server/bin/lua-language-server" },
--   settings = {
--     Lua = {
--       runtime = { version = "LuaJIT" }, -- LuaJIT is used for Neovim
--       diagnostics = { globals = { "vim" } }, -- Fix "vim is undefined" error
--       workspace = { library = vim.api.nvim_get_runtime_file("", true) },
--       telemetry = { enable = false },
--     }
--   }
-- })


-- 🟦 JavaScript & TypeScript LSP
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

-- 🌍 HTML LSP
-- lspconfig.html.setup({
--   filetypes = { "html" },
--   capabilities = vim.lsp.protocol.make_client_capabilities(),
-- })
--
-- -- 🎨 CSS LSP
-- lspconfig.cssls.setup({
--   filetypes = { "css", "scss", "less" },
--   settings = {
--     css = { validate = true },
--     scss = { validate = true },
--     less = { validate = true },
--   },
-- })
--
-- 🐍 Python LSP
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


