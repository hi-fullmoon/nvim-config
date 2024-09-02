local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 基础配置
------------------------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.o.clipboard = 'unnamedplus'

-- 一些命令
------------------------------------------------------------------------------------------
vim.cmd [[
  autocmd InsertLeave * :silent !/usr/local/bin/macism com.apple.keylayout.ABC
]]

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- vscode 按键映射
------------------------------------------------------------------------------------------
local vscode = require('vscode')

vim.keymap.set('n', 'K', function() vscode.action('editor.action.showHover') end)
vim.keymap.set('n', 'W', function() vscode.action('workbench.action.files.save') end)
vim.keymap.set('n', 'Q', function() vscode.call('workbench.action.closeActiveEditor') end)
vim.keymap.set('n', 'tt', function() vscode.call('workbench.explorer.fileView.focus') end)

vim.keymap.set('n', '<leader>be', function() vscode.call('workbench.action.showAllEditors') end)

vim.keymap.set('n', '<leader>1', function() vscode.call('workbench.action.openEditorAtIndex1') end)
vim.keymap.set('n', '<leader>2', function() vscode.call('workbench.action.openEditorAtIndex2') end)
vim.keymap.set('n', '<leader>3', function() vscode.call('workbench.action.openEditorAtIndex3') end)
vim.keymap.set('n', '<leader>4', function() vscode.call('workbench.action.openEditorAtIndex4') end)
vim.keymap.set('n', '<leader>5', function() vscode.call('workbench.action.openEditorAtIndex5') end)
vim.keymap.set('n', '<leader>6', function() vscode.call('workbench.action.openEditorAtIndex6') end)
vim.keymap.set('n', '<leader>co', function() vscode.call('workbench.action.closeOtherEditors') end)

vim.keymap.set('n', '<leader>rn', function() vscode.call('editor.action.rename') end)
vim.keymap.set('n', '<leader>ca', function() vscode.call('editor.action.quickFix') end)
vim.keymap.set('n', '<leader>fr', function() vscode.call('editor.action.goToReferences') end)
vim.keymap.set('n', '<leader>q', function() vscode.call('workbench.action.closeActiveEditor') end)
vim.keymap.set('n', '<leader>ff', function() vscode.call('workbench.action.quickOpen') end)
vim.keymap.set('n', '<leader>fg', function() vscode.call('workbench.action.findInFiles') end)
vim.keymap.set('n', '<leader>sp', function() vscode.call('workbench.action.replaceInFiles') end)
vim.keymap.set('n', '<leader>fr', function() vscode.call('workbench.action.openRecent') end)
vim.keymap.set('n', '<leader>[', function() vscode.call('editor.action.marker.prev') end)
vim.keymap.set('n', '<leader>]', function() vscode.call('editor.action.marker.next') end)
vim.keymap.set('n', '[c', function() vscode.call('editor.action.dirtydiff.previous') end)
vim.keymap.set('n', ']c', function() vscode.call('editor.action.dirtydiff.next') end)

-- 加载 neovim 插件
------------------------------------------------------------------------------------------
require('lazy').setup('plugins')
