return {
  'williamboman/mason.nvim',
  cond = not vim.g.vscode,
  dependencies = {
    'williamboman/mason-lspconfig.nvim'
  },
  config = function()
    require('mason').setup()
    require("mason-lspconfig").setup({
      ensure_installed = { 'lua_ls', 'ts_ls', 'eslint', 'gopls', 'rust_analyzer', 'volar' },
    })
  end
}
