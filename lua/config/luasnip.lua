local status_ok, ls = pcall(require, 'luasnip')
if not status_ok then
  return
end

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
