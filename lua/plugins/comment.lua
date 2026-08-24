return {
  "numToStr/Comment.nvim",
  cond = not vim.g.vscode,
  keys = {
    { "gc", mode = { "n", "x" }, desc = "切换行注释" },
    { "gb", mode = { "n", "x" }, desc = "切换块注释" },
  },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
