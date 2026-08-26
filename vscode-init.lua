vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.clipboard = "unnamedplus"
require("command")

-- vscode 按键映射
local vscode = require("vscode")

local function action(command)
  return function()
    vscode.action(command)
  end
end

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

map("n", "tt", action("workbench.explorer.fileView.focus"), "聚焦文件资源管理器")
map("n", "K", action("editor.action.showHover"), "显示悬浮信息")
map("n", "W", action("workbench.action.files.saveAll"), "保存所有文件")
map("n", "Q", action("workbench.action.closeActiveEditor"), "关闭编辑器")
map("n", "gt", action("editor.action.goToTypeDefinition"), "跳转到类型定义")
map("n", "gr", action("editor.action.goToReferences"), "查找引用")

for index = 1, 6 do
  map("n", "<leader>" .. index, action("workbench.action.openEditorAtIndex" .. index), "切换到编辑器 " .. index)
end

map("n", "<leader>be", action("workbench.action.showAllEditors"), "显示所有编辑器")
map("n", "[b", action("workbench.action.previousEditor"), "切换到上一个编辑器")
map("n", "]b", action("workbench.action.nextEditor"), "切换到下一个编辑器")
map("n", "<leader>co", action("workbench.action.closeOtherEditors"), "关闭其他编辑器")
map("n", "<leader>rn", action("editor.action.rename"), "重命名符号")
map("n", "<leader>ca", action("editor.action.quickFix"), "快速修复")
map("n", "<leader>q", action("workbench.action.closeActiveEditor"), "关闭编辑器")
map("n", "<leader>ff", action("workbench.action.quickOpen"), "快速打开")
map("n", "<leader>fg", action("workbench.action.findInFiles"), "在文件中查找")
map("n", "<leader>sp", action("workbench.action.replaceInFiles"), "在文件中替换")
map("n", "<leader>or", action("workbench.action.openRecent"), "打开最近项目")
map("n", "<leader>[", action("editor.action.marker.prev"), "上一个诊断")
map("n", "<leader>]", action("editor.action.marker.next"), "下一个诊断")
map("n", "[c", action("editor.action.dirtydiff.previous"), "上一个 Git 变更")
map("n", "]c", action("editor.action.dirtydiff.next"), "下一个 Git 变更")
map({ "n", "x" }, "<leader>ar", action("editor.action.refactor"), "重构")

for _, name in ipairs({ "RE", "Re" }) do
  vim.api.nvim_create_user_command(name, action("vscode-neovim.restart"), {})
end

for _, name in ipairs({ "Noh", "NOH" }) do
  vim.api.nvim_create_user_command(name, function()
    vim.cmd("nohlsearch")
  end, {})
end

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = false },
})
