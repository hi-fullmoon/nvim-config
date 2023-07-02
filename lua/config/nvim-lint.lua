local status_ok, lint = pcall(require, 'lint')
if not status_ok then
  return
end

lint.linters_by_ft = {
  javascript= { 'eslint' },
  javascriptreact = { 'eslint' },
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
  css = { 'stylelint' },
  less = { 'stylelint' },
  sass = { 'stylelint' },
  scss = { 'stylelint' }
}
