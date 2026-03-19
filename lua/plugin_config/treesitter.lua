-- Install parsers
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  once = true,
  callback = function()
    local langs = { "c", "c_sharp", "cpp", "python", "lua", "javascript", "html", "css", "go", "typescript", "rust" }
    for _, lang in ipairs(langs) do
      pcall(function()
        if not pcall(vim.treesitter.language.inspect, lang) then
          vim.cmd("TSInstall " .. lang)
        end
      end)
    end
  end,
})

-- Textobjects keymaps
local select = require("nvim-treesitter-textobjects.select")

local function textobj_map(mode, key, query)
  vim.keymap.set(mode, key, function()
    select.select_textobject(query, "textobjects")
  end, { silent = true })
end

textobj_map({ "x", "o" }, "af", "@function.outer")
textobj_map({ "x", "o" }, "if", "@function.inner")
textobj_map({ "x", "o" }, "ac", "@class.outer")
textobj_map({ "x", "o" }, "ic", "@class.inner")

-- Config
require("nvim-treesitter-textobjects.config").update({
  select = {
    lookahead = true,
  },
})
