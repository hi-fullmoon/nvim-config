-- 检测操作系统和芯片架构
if vim.fn.has('mac') == 1 then
  -- 检测是否为 Apple Silicon
  local is_apple_silicon = vim.fn.system('uname -m'):find('arm64') ~= nil
  local macism_path = is_apple_silicon
    and '/opt/homebrew/bin/macism'  -- Apple Silicon 路径
    or '/usr/local/bin/macism'      -- Intel 路径

  vim.cmd(string.format([[
    autocmd InsertLeave * :silent !%s com.apple.keylayout.ABC
  ]], macism_path))
elseif vim.fn.has('win32') == 1 then
  vim.cmd [[
    autocmd InsertLeave * :silent !im-select 1033
  ]]
end

-- 复制高亮
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
