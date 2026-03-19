-- Keybindings for Telescope search
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })

-- Toggle file explorer
vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', { noremap = true, silent = true })

-- Toggle open buffers view
vim.keymap.set('n', '<leader>ob', ':Neotree buffers toggle left<CR>', { noremap = true, silent = true })

-- Toggle Git status view
vim.keymap.set('n', '<leader>og', ':Neotree git_status toggle left<CR>', { noremap = true, silent = true })

-- Format code using LSP formatter (Alt+Shift+I like VSCode, and <leader>fm fallback)
local fmt = function() vim.lsp.buf.format({ async = true }) end
vim.keymap.set({ 'n', 'v' }, '<M-S-i>', fmt, { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>fm', fmt, { noremap = true, silent = true })

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Navigate buffers
vim.keymap.set('n', '<Tab>n', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>p', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Close the current buffer
vim.keymap.set('n', '<leader>q', ':bdelete<CR>', { noremap = true, silent = true })

-- Close all buffers except the current one
vim.keymap.set('n', '<leader>Q', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

-- Switch to a specific buffer (buffer picker)
vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true })

-- Clear search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })

-- jj for exiting insert mode
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Keybindings for diagnostics navigation
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })

-- Toggle diagnostics list (open/close)
local diagnostics_active = false
vim.keymap.set('n', '<leader>dl', function()
  if diagnostics_active then
    vim.cmd('lclose')
    diagnostics_active = false
  else
    vim.diagnostic.setloclist()
    diagnostics_active = true
  end
end, { desc = 'Toggle diagnostics list' })

-- Keybindings for DAP
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>du', function() require('dapui').toggle() end)
