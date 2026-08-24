return {
  "williamboman/mason.nvim",
  cond = not vim.g.vscode,
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
  opts = {},
}
