


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

