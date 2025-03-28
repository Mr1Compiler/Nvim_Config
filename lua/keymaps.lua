-- Global settings for spaces
vim.o.tabstop = 4          -- Number of spaces a tab character represents
vim.o.shiftwidth = 4       -- Number of spaces to use for each level of indentation
vim.o.expandtab = true     -- Use spaces instead of tabs


-- Toggle comment with gcc
vim.api.nvim_set_keymap('n', 'gcc', "I// <Esc>", { noremap = true, silent = true })

-- Toggle comment for selected lines in Visual Mode
vim.api.nvim_set_keymap('v', 'gc', ":s/^/\\/\\//<CR>:noh<CR>", { noremap = true, silent = true })



-- Keybindings for Telescope search
vim.api.nvim_set_keymap('n', '<leader>ff', ":Telescope find_files<CR>", { noremap = true, silent = true })  -- Search for files
vim.api.nvim_set_keymap('n', '<leader>fg', ":Telescope live_grep<CR>", { noremap = true, silent = true })  -- Search inside files
vim.api.nvim_set_keymap('n', '<leader>fb', ":Telescope buffers<CR>", { noremap = true, silent = true })  -- List open buffers
vim.api.nvim_set_keymap('n', '<leader>fh', ":Telescope help_tags<CR>", { noremap = true, silent = true })  -- Search help tags

-- Toggle NERDTree but focus it if it's already open
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Format code with Neoformat
vim.api.nvim_set_keymap('n', '<A-S-F>', ':Neoformat<CR>', { noremap = true, silent = true })

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

