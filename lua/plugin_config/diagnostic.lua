-- Define custom diagnostic signs for different severity levels
vim.fn.sign_define("DiagnosticSignError", {
  text = "❌",
  texthl = "DiagnosticSignError", -- Highlight group for error signs
})

vim.fn.sign_define("DiagnosticSignWarning", {
  text = "⚠️",
  texthl = "DiagnosticSignWarning", -- Highlight group for warning signs
})

vim.fn.sign_define("DiagnosticSignInformation", {
  text = "ℹ️",
  texthl = "DiagnosticSignInformation", -- Highlight group for info signs
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = "💡",
  texthl = "DiagnosticSignHint", -- Highlight group for hint signs
})

-- Adjust diagnostic display settings
vim.diagnostic.config({
  virtual_text = false,  -- Disable inline errors (errors will not appear in text)
  signs = true,  -- Keep signs in the gutter
  underline = true,
  update_in_insert = true,  -- Prevent errors from appearing while typing
  float = {
    border = "rounded",  -- Use rounded borders for floating errors
    focusable = false,   -- Make the float non-focusable
    source = "always",   -- Always show source in float
  },
})

-- Ensure errors are clear when needed
vim.diagnostic.reset()

-- Customize error highlighting
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff6c6b", bg = "NONE" }) -- Red with no background
vim.api.nvim_set_hl(0, "DiagnosticWarning", { fg = "#e5c07b", bg = "NONE" }) -- Yellow with no background
vim.api.nvim_set_hl(0, "DiagnosticInformation", { fg = "#61afef", bg = "NONE" }) -- Blue with no background
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#98c379", bg = "NONE" }) -- Green with no background

-- Add this autocmd for hover display of diagnostics
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})


vim.o.updatetime = 300  -- Reduce the delay to 300ms
-- If you want to reset diagnostics for a specific buffer:
-- vim.diagnostic.reset(nil, 0)

