# Neovim 配置文档

这是一个同时支持 VSCode Neovim 和原生 Neovim 的配置方案。

## 特性

- 使用 lazy.nvim 作为插件管理器
- 支持 VSCode Neovim 和原生 Neovim 两种使用场景
- 自动切换输入法（支持 macOS 和 Windows）
- 复制高亮提示

## 安装

1. 克隆此仓库到你的 Neovim 配置目录：

Linux/macOS:
git clone https://github.com/your-username/nvim-config.git ~/.config/nvim

Windows:
git clone https://github.com/your-username/nvim-config.git %LOCALAPPDATA%\nvim

2. 启动 Neovim，插件将自动安装。

## VSCode 集成

1. 安装 VSCode 的 Neovim 扩展
2. 在 VSCode 的 settings.json 中添加：

```json
{
  "vscode-neovim.neovimInitVimPaths.darwin": "$HOME/.config/nvim/vscode-init.lua",
  "vscode-neovim.neovimInitVimPaths.win32": "%LOCALAPPDATA%\\nvim\\vscode-init.lua"
}
```

## 输入法自动切换

macOS：需要安装 macism
Windows：需要安装 im-select

## 注意事项

1. 此配置需要 Neovim 0.9.0 或更高版本
2. 部分功能可能需要额外的系统依赖，请查看相应插件的文档
3. 如果使用 macOS，请确保正确设置了 macism 的路径（Intel 和 Apple Silicon 路径不同）
