local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 背景透明
vim.cmd [[
  " hi Normal guibg=NONE ctermbg=NONE
  " hi LineNr guibg=NONE ctermbg=NONE
  " hi SignColumn guibg=NONE ctermbg=NONE
  " hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
  hi FloatBorder guibg=NONE ctermbg=NONE
  hi CursorLineNr term=NONE cterm=NONE guifg=#d8dee9
  hi VertSplit guifg=#343d46 guibg=#343d46
]]

-- 中文输入法切换问题
vim.cmd [[
  autocmd InsertLeave * :silent !/usr/local/bin/macism com.apple.keylayout.ABC
]]

-- 复制高亮
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- 保存时自动格式化
augroup('__formatter__', {
  clear = true,
})
autocmd('BufWritePost', {
	group = '__formatter__',
	command = ':FormatWrite',
})
