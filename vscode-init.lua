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
-- 根据操作系统设置不同的输入法切换命令
if vim.fn.has('mac') == 1 then
  -- 检查是否为 Apple Silicon
  local is_apple_silicon = vim.fn.system('uname -m'):find('arm64') ~= nil
  local macism_path = is_apple_silicon
    and '/opt/homebrew/bin/macism'  -- Apple Silicon 路径
    and '/usr/local/bin/macism'     -- Intel Mac 路径

  vim.cmd(string.format([[
    autocmd InsertLeave * :silent !%s com.apple.keylayout.ABC
  ]], macism_path))
elseif vim.fn.has('win32') == 1 then
  vim.cmd [[
    autocmd InsertLeave * :silent !im-select 1033
  ]]
end

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
vim.keymap.set('n', 'W', function() vscode.action('saveAll') end)
vim.keymap.set('n', 'Q', function() vscode.call('workbench.action.closeActiveEditor') end)
vim.keymap.set('n', 'tt', function() vscode.call('workbench.explorer.fileView.focus') end)
vim.keymap.set('n', '<leader>be', function() vscode.call('workbench.action.showAllEditors') end)

vim.keymap.set('n', '<leader>be', function() vscode.call('workbench.action.showAllEditors') end)

vim.keymap.set('n', '<C>+o', function() vscode.call('workbench.action.navigateBack') end)
vim.keymap.set('n', '<C>+i', function() vscode.call('workbench.action.navigateForward') end)

vim.keymap.set('n', '<leader>1', function() vscode.call('workbench.action.openEditorAtIndex1') end)
vim.keymap.set('n', '<leader>2', function() vscode.call('workbench.action.openEditorAtIndex2') end)
vim.keymap.set('n', '<leader>3', function() vscode.call('workbench.action.openEditorAtIndex3') end)
vim.keymap.set('n', '<leader>4', function() vscode.call('workbench.action.openEditorAtIndex4') end)
vim.keymap.set('n', '<leader>5', function() vscode.call('workbench.action.openEditorAtIndex5') end)
vim.keymap.set('n', '<leader>6', function() vscode.call('workbench.action.openEditorAtIndex6') end)
vim.keymap.set('n', '<leader>co', function() vscode.call('workbench.action.closeOtherEditors') end)

vim.keymap.set('n', '<leader>rn', function() vscode.call('editor.action.rename') end)
vim.keymap.set('n', '<leader>ca', function() vscode.call('editor.action.quickFix') end)
vim.keymap.set('n', '<leader>sa', function() vscode.call('editor.action.sourceAction') end)
vim.keymap.set('n', '<leader>gr', function() vscode.call('editor.action.goToReferences') end)
vim.keymap.set('n', '<leader>q', function() vscode.call('workbench.action.closeActiveEditor') end)
vim.keymap.set('n', '<leader>ff', function() vscode.call('workbench.action.quickOpen') end)
vim.keymap.set('n', '<leader>fg', function() vscode.call('workbench.action.findInFiles') end)
vim.keymap.set('n', '<leader>sp', function() vscode.call('workbench.action.replaceInFiles') end)
vim.keymap.set('n', '<leader>or', function() vscode.call('workbench.action.openRecent') end)
vim.keymap.set('n', '<leader>[', function() vscode.call('editor.action.marker.prev') end)
vim.keymap.set('n', '<leader>]', function() vscode.call('editor.action.marker.next') end)
vim.keymap.set('n', '[c', function() vscode.call('editor.action.dirtydiff.previous') end)
vim.keymap.set('n', ']c', function() vscode.call('editor.action.dirtydiff.next') end)

-- 加载 neovim 插件
------------------------------------------------------------------------------------------
require('lazy').setup('plugins')
