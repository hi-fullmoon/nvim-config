-- 中文输入法切换问题
vim.cmd [[
  autocmd InsertLeave * :silent !/opt/homebrew/bin/macism com.apple.keylayout.ABC
]]

-- 复制高亮
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
