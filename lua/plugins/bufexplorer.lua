return {
  "jlanzarotta/bufexplorer",
  cond = not vim.g.vscode,
  cmd = { "BufExplorer", "ToggleBufExplorer", "OpenBufExplorer" },
}
