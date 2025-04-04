local lsp_util = require("vim.lsp.util")
local orig = lsp_util.locations_to_items

lsp_util.locations_to_items = function(locations, bufnr)
  local ok, items = pcall(orig, locations, bufnr)
  if not ok then
    vim.notify("⚠️ LSP returned invalid location. Try again later or reload OmniSharp.", vim.log.levels.WARN)
    return {}
  end
  return items
end

