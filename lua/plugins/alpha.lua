return {
  'goolord/alpha-nvim',
  cond = not vim.g.vscode,
  config = function()
    require('alpha').setup(require('alpha.themes.startify').config)
  end
}
