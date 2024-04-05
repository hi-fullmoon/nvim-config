return {
  'windwp/nvim-ts-autotag',
  cond = not vim.g.vscode,
  config = function ()
    require('nvim-ts-autotag').setup()
  end
}
