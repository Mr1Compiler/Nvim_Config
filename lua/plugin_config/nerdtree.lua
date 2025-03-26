
-- 🟢 NERDTree Settings
vim.g.NERDTreeWinSize = 30                -- Set the width of NERDTree window
vim.g.NERDTreeShowHidden = 1               -- Show hidden files (e.g., .gitignore)
vim.g.NERDTreeMinimalUI = 1                -- Minimal UI
vim.g.NERDTreeAutoDeleteBuffer = 1         -- Close buffer when deleting a file
vim.g.NERDTreeIgnore = { '.git', 'node_modules', '__pycache__' } -- Ignore these folders

-- 🔹 Keybinding to toggle NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- 🟡 Automatically open NERDTree when opening Neovim with a directory
vim.cmd([[ 
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | execute 'NERDTree' | endif 
]])

-- 🔴 Automatically close Neovim if NERDTree is the last window open
vim.cmd([[ 
  autocmd BufEnter * if winnr("$") == 1 && exists("b:NERDTree") | quit | endif 
]])

-- 🟢 Ensure `vim-devicons` is installed
if vim.fn.exists('g:loaded_webdevicons') == 0 then
  print("⚠️ Warning: vim-devicons not found! Install it for proper icons.")
end

-- 🎨 NERDTree Icons (vim-devicons support)
vim.g.NERDTreeMapOpen = ""
vim.g.NERDTreeMapClose = ""
vim.g.NERDTreeMapFile = ""
vim.g.NERDTreeMapSymlink = ""
vim.g.NERDTreeMapExecFile = ""
vim.g.NERDTreeMapBookmark = ""

vim.g.NERDTreeMapExtensions = {
  ['py'] = '',
  ['html'] = '',
  ['js'] = '',
  ['lua'] = '',
  ['rs'] = '',
  ['go'] = '',
  ['cs'] = '󰌛', -- C# Icon (updated)
}

-- 🟢 Enable Colors for Icons
vim.g.webdevicons_enable = 1
vim.g.webdevicons_enable_nerdtree = 1
vim.g.webdevicons_color_icons = 1

