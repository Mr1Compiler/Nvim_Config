-- Add Go to PATH before loading any Go-related configs
vim.env.PATH = "/usr/local/go/bin:" .. vim.env.PATH

local ok, go = pcall(require, "go")
if not ok then
    vim.notify("go.nvim not found!", vim.log.levels.ERROR)
    return
end

go.setup({
    go = "/usr/local/go/bin/go",  -- Explicitly set Go path
    gopls_cmd = { "gopls" },
    goimport = "gopls",
    fillstruct = "gopls",
    lsp_inlay_hints = { enable = true },
    lsp_cfg = false,  -- Disable, we handle LSP manually below
})

-- Use new nvim 0.11 API
vim.lsp.config.gopls = {
    cmd = { "/home/mr1compiler/go/bin/gopls" },
    filetypes = { "go", "gomod" },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
        gopls = {
            analyses = { unusedparams = true, nilness = true },
            staticcheck = true,
        },
    },
}

-- Enable gopls LSP
vim.lsp.enable("gopls")

-- Set up keymaps for Go files
vim.api.nvim_create_autocmd("LspAttach", {
    pattern = { "*.go" },
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "gopls" then
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end
    end,
})

