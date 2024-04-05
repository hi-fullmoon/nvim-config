return {
  'moll/vim-bbye',
  cond = not vim.g.vscode,
  config = function()
    vim.keymap.set('n', '<leader>q', ':Bdelete<CR>', {})
  end
}
