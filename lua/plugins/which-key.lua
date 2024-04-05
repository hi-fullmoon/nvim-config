return {
  'folke/which-key.nvim',
  cond = not vim.g.vscode,
  config = function ()
    require('which-key').setup()
  end
}
