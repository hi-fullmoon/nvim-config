local opt = vim.opt

opt.cursorline = true
opt.autoindent = true
opt.hlsearch = true
opt.showmatch = false
opt.wildmenu = true
opt.showcmd = true
opt.termguicolors = true

opt.number = true
opt.relativenumber = false

opt.scrolloff = 6
opt.sidescrolloff = 6

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.backup = false
opt.swapfile = false
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.wrap = false
opt.splitbelow = true
opt.splitright = true

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

opt.completeopt = { "menuone", "noinsert", "noselect" }
opt.shortmess:append("c")

opt.fillchars:append({ vert = " " })
opt.synmaxcol = 400
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 400

-- 没有 Treesitter parser 时仍保留 Vim 自带的语法高亮。
vim.cmd("syntax enable")

-- Treesitter 会在支持当前文件类型时按窗口启用折叠表达式。
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
