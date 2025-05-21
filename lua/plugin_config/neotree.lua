require("neo-tree").setup({
  sources = { "filesystem", "buffers", "git_status" },
 source_selector = {
    winbar = true, -- or `statusline = true` to show tabs in statusline
    content_layout = "center",
    tabs_layout = "equal",
  },
  git_status = {
    symbols = {
      added     = "✚",
      modified  = "●",
      deleted   = "✖",
      renamed   = "➜",
      untracked = "?",
      ignored   = "◌",
      unstaged  = "✗",
      staged    = "✓",
      conflict  = "",
    }
  },
})

