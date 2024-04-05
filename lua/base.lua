vim.g.mapleader = ' '

vim.scriptencoding = 'utf-8'

vim.o.cursorline = true
vim.o.autoindent = true
vim.o.filetype = 'plugin'
vim.o.hlsearch = true
vim.o.showmatch = false
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.syntax = 'on'

vim.o.number = true
vim.o.relativenumber = false

vim.o.scrolloff = 6
vim.o.sidescrolloff = 6

vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

vim.o.backup = false
vim.o.swapfile = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.wrap = false

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.opt.fillchars = {
  vert = ' ',
}
vim.o.synmaxcol = 400
vim.o.signcolumn = 'yes'

vim.o.foldenable = true
vim.o.foldlevel = 100
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
