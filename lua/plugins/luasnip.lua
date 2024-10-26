return {
  'L3MON4D3/LuaSnip',
  cond = not vim.g.vscode,
  version = 'v2.*',
  config = function()
    local ls = require('luasnip')

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    local log = s('log', {
      t('console.log('),
      i(1, ''),
      t(')'),
    })

    ls.add_snippets('javascript', {
      log,
    })

    ls.add_snippets('javascriptreact', {
      log,
    })

    ls.add_snippets('typescript', {
      log,
    })

    ls.add_snippets('typescriptreact', {
      log,
    })

    ls.add_snippets('vue', {
      log,
    })
  end
}
