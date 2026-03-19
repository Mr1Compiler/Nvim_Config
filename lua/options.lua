--font
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"  -- Change 'h12' to your preferred size

vim.wo.number = true
vim.wo.relativenumber = true

-- Set background to dark
vim.o.background = 'dark'

-- Enable mouse support
vim.o.mouse = 'a'

-- Default tab settings (4 spaces)
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Per-language tab settings
vim.cmd([[
  augroup FileTypeIndent
    autocmd!
    " JavaScript/TypeScript/JSON: 2 spaces
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact,json setlocal tabstop=2 shiftwidth=2 expandtab
    " Python: 4 spaces (PEP 8)
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
    " C/C++: 4 spaces
    autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab
    " Go: tabs (Go convention)
    autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
    " Lua: 2 spaces
    autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab
    " HTML/CSS: 2 spaces
    autocmd FileType html,css,scss setlocal tabstop=2 shiftwidth=2 expandtab
  augroup END
]])

-- Auto-save when leaving insert mode or text changes
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if vim.bo[buf].modified and vim.bo[buf].buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("update")
    end
  end,
})

-- Arabic/RTL support
vim.opt.encoding = 'utf-8'
vim.opt.arabicshape = true
vim.opt.termbidi = false

-- Toggle Arabic mode: <Leader>a
vim.keymap.set('n', '<Leader>a', function()
  vim.wo.arabic = not vim.wo.arabic
  vim.wo.rightleft = vim.wo.arabic
end, { desc = 'Toggle Arabic mode' })
