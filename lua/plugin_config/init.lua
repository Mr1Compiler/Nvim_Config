-- plugin_config/init.lua
-- Wrap each require in pcall so missing plugins don't break startup
local configs = {
  'plugin_config.colorscheme',
  -- treesitter is loaded via lazy.nvim config callback
  'plugin_config.lspconfig',
  'plugin_config.cmp',
  'plugin_config.go',
  'plugin_config.neotree',
  'plugin_config.lualine',
  'plugin_config.diagnostic',
  'plugin_config.bufferline',
  'plugin_config.comment',
  'plugin_config.dap',
  'plugin_config.telescope',
}

for _, mod in ipairs(configs) do
  local ok, err = pcall(require, mod)
  if not ok then
    vim.notify("Failed to load " .. mod .. ": " .. err, vim.log.levels.WARN)
  end
end

