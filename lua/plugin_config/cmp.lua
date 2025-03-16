local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Using LuaSnip for snippets
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  window = {
    completion = {
      border = 'rounded',
      winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None',  -- Ensure colors match your theme
    },
    documentation = {
      border = 'rounded',
      winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:None',  -- Same for documentation window
    },
  },
})

-- Gruvbox color palette for completion menu highlights
vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#ebdbb2', bg = '#3c3836' })  -- Light text on dark background
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = '#3c3836', bg = '#d79921' })  -- Highlight selected item
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = '#3c3836' })  -- Sidebar background
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#d79921' })  -- Scrollbar thumb

