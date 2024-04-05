return {
  'mhartington/oceanic-next',
  cond = not vim.g.vscode,
  config = function()
    vim.cmd [[colorscheme OceanicNext]]
  end
}
