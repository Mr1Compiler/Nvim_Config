local cmp = require("cmp")
local luasnip = require("luasnip")
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For luasnip users
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept completion

    -- Tab to navigate completion menu
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Shift+Tab to navigate backwards
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- Snippets
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    }),
    documentation = cmp.config.window.bordered(),
  },
})

-- -- Gruvbox color palette for completion menu highlights
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#ebdbb2", bg = "#3c3836" }) -- Light text on dark background
-- --vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#d79921', bold = true })  -- Use only background
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3c3836" }) -- Ensure cursor line is visible
-- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#3c3836" }) -- Sidebar background
-- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#d79921" }) -- Scrollbar thumb

--Ensure that PmenuSel is applied correctly
-- vim.cmd([[ autocmd ColorScheme * highlight! link CmpPmenu Pmenu ]])
-- vim.cmd([[ autocmd ColorScheme * highlight! link CmpPmenuSel PmenuSel ]])
