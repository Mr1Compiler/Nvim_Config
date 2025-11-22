-- Toggle comment with gcc
vim.api.nvim_set_keymap('n', 'gcc', "I// <Esc>", { noremap = true, silent = true })

-- Toggle comment for selected lines in Visual Mode
vim.api.nvim_set_keymap('v', 'gc', ":s/^/\\/\\//<CR>:noh<CR>", { noremap = true, silent = true })




-- Keybindings for Telescope search
vim.api.nvim_set_keymap('n', '<leader>ff', ":Telescope find_files<CR>", { noremap = true, silent = true })  -- Search for files
vim.api.nvim_set_keymap('n', '<leader>fg', ":Telescope live_grep<CR>", { noremap = true, silent = true })  -- Search inside files
vim.api.nvim_set_keymap('n', '<leader>fb', ":Telescope buffers<CR>", { noremap = true, silent = true })  -- List open buffers
vim.api.nvim_set_keymap('n', '<leader>fh', ":Telescope help_tags<CR>", { noremap = true, silent = true })  -- Search help tags

-- Toggle file explorer
vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", { noremap = true, silent = true })

-- Toggle open buffers view
vim.keymap.set("n", "<leader>ob", ":Neotree buffers toggle left<CR>", { noremap = true, silent = true })

-- Toggle Git status view
vim.keymap.set("n", "<leader>og", ":Neotree git_status toggle left<CR>", { noremap = true, silent = true })


-- Format code using LSP formatter (like Ctrl+Shift+I in VS Code)
vim.keymap.set("n", "<C-S-i>", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })
vim.keymap.set("v", "<C-S-i>", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })
-- Alternative keybinding if Ctrl+Shift+I doesn't work in your terminal
vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })
vim.keymap.set("v", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })

-- Navigate vim panes better
vim.api.nvim_set_keymap('n', '<c-k>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-h>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Navigate to the next buffer using Tab + n
vim.api.nvim_set_keymap('n', '<Tab>n', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Navigate to the previous buffer using Tab + p
vim.api.nvim_set_keymap('n', '<Tab>p', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })


-- Close the current buffer (same as pressing the close button in Bufferline)
vim.api.nvim_set_keymap('n', '<leader>q', ':bdelete<CR>', { noremap = true, silent = true })

-- Close all buffers except the current one
vim.api.nvim_set_keymap('n', '<Leader>Q', ':BufferLinePickClose<CR>', { noremap = true, silent = true })

-- Switch to a specific buffer (buffer picker)
vim.api.nvim_set_keymap('n', '<Leader>b', ':BufferLinePick<CR>', { noremap = true, silent = true })

-- Toggle Bufferline visibility (optional)
vim.api.nvim_set_keymap('n', '<Leader>B', ':BufferLineToggle<CR>', { noremap = true, silent = true })

-- Clear search highlight
vim.api.nvim_set_keymap('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })

-- jj for exiting insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Keybindings for diagnostics navigation
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })

-- Toggle diagnostics list (open/close)
local diagnostics_active = false
vim.keymap.set('n', '<leader>q', function()
  if diagnostics_active then
    vim.cmd('lclose')
    diagnostics_active = false
  else
    vim.diagnostic.setloclist()
    diagnostics_active = true
  end
end, { desc = 'Toggle diagnostics list' })

-- Show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.lsp.buf.hover() then
        vim.lsp.buf.hover()
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.api.nvim_set_keymap('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Search in NERDTree with 'f' key
vim.api.nvim_set_keymap('n', '<leader>f', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- Highlight the symbol and its references on a CursorHold event
-- vim.api.nvim_create_augroup("LSPGroup", {})
-- vim.api.nvim_create_autocmd("CursorHold", {
--     group = "LSPGroup",
--     command = "silent lua vim.lsp.buf.document_highlight()",
--     desc = "Highlight symbol under cursor on CursorHold",
-- })


-- Keybindings for DAP
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<Leader>du", ":lua require'dapui'.toggle()<CR>")

