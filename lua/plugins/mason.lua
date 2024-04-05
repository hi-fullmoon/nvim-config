return {
  'williamboman/mason.nvim',
  cond = not vim.g.vscode,
  dependencies = {
    'williamboman/mason-lspconfig.nvim'
  },
  config = function()
    require('mason').setup()
    require("mason-lspconfig").setup()
  end
}
