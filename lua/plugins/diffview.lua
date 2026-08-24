return {
  "sindrets/diffview.nvim",
  cond = not vim.g.vscode,
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewFocusFiles", "DiffviewToggleFiles" },
  opts = {},
}
