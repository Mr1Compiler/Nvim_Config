-- Define custom diagnostic signs for different severity levels
vim.fn.sign_define("DiagnosticSignError", {
  text = "❌",
  texthl = "DiagnosticSignError", -- Highlight group for error signs
})

vim.fn.sign_define("DiagnosticSignWarn", {
  text = "⚠️",
  texthl = "DiagnosticSignWarn", -- Highlight group for warning signs
})

vim.fn.sign_define("DiagnosticSignInfo", {
  text = "ℹ️",
  texthl = "DiagnosticSignInfo", -- Highlight group for info signs
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = "💡",
  texthl = "DiagnosticSignHint", -- Highlight group for hint signs
})

-- Adjust diagnostic display settings
vim.diagnostic.config({
  virtual_text = true,  -- Show errors inline after the line
  signs = true,  -- Show signs in the gutter (❌, ⚠️, etc.)
  underline = true,
  update_in_insert = false,  -- Prevent errors from appearing while typing
  severity_sort = true,  -- Sort diagnostics by severity
  float = {
    border = "rounded",  -- Use rounded borders for floating errors
    focusable = false,   -- Make the float non-focusable
    source = "always",   -- Always show source in float
  },
})

-- Hide diagnostics in insert mode, show on leave
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.diagnostic.enable(true, { bufnr = 0 })
  end,
})

-- Show diagnostic float on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

vim.o.updatetime = 1000
