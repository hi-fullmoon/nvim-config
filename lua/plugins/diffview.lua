return {
  'sindrets/diffview.nvim',
  cond = not vim.g.vscode,
  config = function ()
    require('diffview').setup({})
  end
}
