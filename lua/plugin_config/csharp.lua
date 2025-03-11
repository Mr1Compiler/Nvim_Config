local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Set up csharp-ls (C# Language Server)
lspconfig.csharp_ls.setup({
    cmd = { "csharp-ls", "--stdio" },  -- Ensure 'csharp-ls' is in your PATH
    capabilities = cmp_nvim_lsp.default_capabilities(),
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true, buffer=bufnr }
        -- LSP Keybindings
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end
})
