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

local function call(command)
  return function()
    vscode.call(command)
  end
end

local function action(command)
  return function()
    vscode.action(command)
  end
end

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

map("n", "j", call("cursorDown"), "下移光标")
map("n", "k", call("cursorUp"), "上移光标")
map("n", "l", call("cursorRight"), "右移光标")
map("n", "h", call("cursorLeft"), "左移光标")
map("n", "tt", call("workbench.explorer.fileView.focus"), "聚焦文件资源管理器")
map("n", "K", action("editor.action.showHover"), "显示悬浮信息")
map("n", "W", call("workbench.action.files.saveAll"), "保存所有文件")
map("n", "Q", call("workbench.action.closeActiveEditor"), "关闭编辑器")
map("n", "gt", call("editor.action.goToTypeDefinition"), "跳转到类型定义")
map("n", "gr", call("editor.action.goToReferences"), "查找引用")

for index = 1, 6 do
  map("n", "<leader>" .. index, call("workbench.action.openEditorAtIndex" .. index), "切换到编辑器 " .. index)
end

map("n", "<leader>be", call("workbench.action.showAllEditors"), "显示所有编辑器")
map("n", "<leader>co", call("workbench.action.closeOtherEditors"), "关闭其他编辑器")
map("n", "<leader>rn", call("editor.action.rename"), "重命名符号")
map("n", "<leader>ca", call("editor.action.quickFix"), "快速修复")
map("n", "<leader>q", call("workbench.action.closeActiveEditor"), "关闭编辑器")
map("n", "<leader>ff", call("workbench.action.quickOpen"), "快速打开")
map("n", "<leader>fg", call("workbench.action.findInFiles"), "在文件中查找")
map("n", "<leader>sp", call("workbench.action.replaceInFiles"), "在文件中替换")
map("n", "<leader>or", call("workbench.action.openRecent"), "打开最近项目")
map("n", "<leader>[", call("editor.action.marker.prev"), "上一个诊断")
map("n", "<leader>]", call("editor.action.marker.next"), "下一个诊断")
map("n", "[c", call("editor.action.dirtydiff.previous"), "上一个 Git 变更")
map("n", "]c", call("editor.action.dirtydiff.next"), "下一个 Git 变更")
map({ "n", "x" }, "<leader>ar", action("editor.action.refactor"), "重构")

for _, name in ipairs({ "RE", "Re" }) do
  vim.api.nvim_create_user_command(name, call("vscode-neovim.restart"), {})
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
