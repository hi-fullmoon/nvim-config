return {
  "j-hui/fidget.nvim",
  cond = not vim.g.vscode,
  event = "LspAttach",
  opts = {
    notification = {
      window = {
        winblend = 0,
      },
    },
  },
}
