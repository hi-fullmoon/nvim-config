return {
  "folke/which-key.nvim",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  config = function()
    require("which-key").setup()
    require("which-key").add({
      { "<leader>b", group = "Buffer" },
      { "<leader>f", group = "Find/Format" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>c", group = "Close/Code" },
      { "<leader>s", group = "Search/Replace" },
    })
  end,
}
