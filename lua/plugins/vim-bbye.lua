return {
  "moll/vim-bbye",
  cond = not vim.g.vscode,
  cmd = { "Bdelete", "Bwipeout" },
  keys = { { "<leader>q", "<cmd>Bdelete<cr>", desc = "关闭缓冲区" } },
}
