# Neovim 配置文档

这是一套同时支持原生 Neovim 与 VSCode Neovim 的 Lua 配置。

## 特性

- 使用 lazy.nvim 管理插件，并按事件、命令和键位延迟加载
- 内置 LSP、补全、格式化、Treesitter、Git 和 Telescope 工作流
- 原生 Neovim 与 VSCode Neovim 共用基础行为
- 离开插入模式时异步切换到英文输入法（macOS / Windows）
- 复制文本后短暂高亮

## 环境要求

- Neovim 0.12 或更高版本
- Git
- `rg`（Telescope 全文搜索）
- Nerd Font（正确显示图标）
- 编译 Treesitter parser 所需的 C 编译器和 tree-sitter CLI
- 按使用语言安装格式化器：`stylua`、`isort` / `black`、`prettier`、`rustfmt`

## 安装

1. 克隆此仓库到你的 Neovim 配置目录：

   Linux / macOS：

   ```sh
   git clone https://github.com/hi-fullmoon/nvim-config.git ~/.config/nvim
   ```

   Windows：

   ```powershell
   git clone https://github.com/hi-fullmoon/nvim-config.git $env:LOCALAPPDATA\nvim
   ```

2. 启动 Neovim。lazy.nvim 会安装插件，Mason 会安装配置中声明的语言服务器。

3. 按需安装 Treesitter parser，例如：

   ```vim
   :TSInstall lua vim vimdoc query javascript typescript tsx vue html css json
   ```

4. 运行 `:checkhealth` 检查缺失的系统依赖。

## VSCode 集成

1. 安装 VSCode 的 Neovim 扩展
2. 在 VSCode 的 `settings.json` 中添加：

```json
{
  "vscode-neovim.neovimInitVimPaths.darwin": "$HOME/.config/nvim/vscode-init.lua",
  "vscode-neovim.neovimInitVimPaths.win32": "%LOCALAPPDATA%\\nvim\\vscode-init.lua"
}
```

## 输入法自动切换

macOS 需要安装 `macism`，Windows 需要安装 `im-select`。未检测到对应工具时会自动跳过，不影响启动。

## 常用维护命令

- `:Lazy`：查看、更新和清理插件
- `:Mason`：管理 LSP、格式化器和其他开发工具
- `:TSUpdate`：更新已经安装的 Treesitter parser
- `:ConformInfo`：查看当前文件的格式化器状态
- `:checkhealth`：诊断 Neovim 与插件环境
