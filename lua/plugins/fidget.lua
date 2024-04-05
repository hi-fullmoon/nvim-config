return {
  'j-hui/fidget.nvim',
  cond = not vim.g.vscode,
  tag = 'legacy',
  config = function ()
    require('fidget').setup({
      window = {
        blend = 0,
      }
    })
  end
}
