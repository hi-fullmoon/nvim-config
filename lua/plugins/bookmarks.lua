return {
  'MattesGroeger/vim-bookmarks',
  cond = not vim.g.vscode,
  config = function()
    vim.g.bookmark_sign = '♥'
  end
}
