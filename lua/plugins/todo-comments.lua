return {
  "folke/todo-comments.nvim",
  cond = not vim.g.vscode,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
}
