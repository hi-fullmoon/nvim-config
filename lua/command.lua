local command_group = vim.api.nvim_create_augroup("UserCommands", { clear = true })

local function input_method_command()
  if vim.fn.has("mac") == 1 then
    local path = vim.fn.exepath("macism")
    if path == "" then
      local machine = (vim.uv or vim.loop).os_uname().machine
      path = machine == "arm64" and "/opt/homebrew/bin/macism" or "/usr/local/bin/macism"
    end

    if vim.fn.executable(path) == 1 then
      return { path, "com.apple.keylayout.ABC" }
    end
  elseif vim.fn.has("win32") == 1 and vim.fn.executable("im-select") == 1 then
    return { "im-select", "1033" }
  end
end

local switch_input_method = input_method_command()
if switch_input_method then
  vim.api.nvim_create_autocmd("InsertLeave", {
    group = command_group,
    callback = function()
      -- 避免 shell 命令阻塞 Neovim 的主线程。
      vim.system(switch_input_method, { detach = true })
    end,
    desc = "离开插入模式后切换到英文输入法",
  })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = command_group,
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
  desc = "短暂高亮复制的文本",
})
