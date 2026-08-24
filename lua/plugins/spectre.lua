return {
  "windwp/nvim-spectre",
  cond = not vim.g.vscode,
  cmd = "Spectre",
  keys = {
    {
      "<leader>S",
      function()
        require("spectre").open()
      end,
      desc = "全局搜索替换",
    },
    {
      "<leader>sp",
      function()
        require("spectre").open_file_search()
      end,
      desc = "在当前文件搜索替换",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "搜索当前单词",
    },
  },
  opts = {},
}
