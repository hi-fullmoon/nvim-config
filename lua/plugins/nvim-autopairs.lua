return {
  'windwp/nvim-autopairs',
  cond = not vim.g.vscode,
  config = function()
    require('nvim-autopairs').setup();
  end
}
