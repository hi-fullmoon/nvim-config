return {
  'nvim-tree/nvim-web-devicons',
  cond = not vim.g.vscode,
  config = function ()
    require('nvim-web-devicons').setup({
      override_by_filename = {
        ['.prettierrc'] = {
          icon = '',
          color = '#fff2f2',
          name = 'PrettierConfig'
        }
      }
    })
  end
}
