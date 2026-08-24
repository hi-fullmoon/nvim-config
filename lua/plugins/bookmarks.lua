return {
  "MattesGroeger/vim-bookmarks",
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    vim.g.bookmark_sign = "♥"
  end,
}
