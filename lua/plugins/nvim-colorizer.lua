return {
  "NvChad/nvim-colorizer.lua",
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile" },
  opts = {},
}
