return {
  "nvim-telescope/telescope.nvim",
  cond = not vim.g.vscode,
  cmd = "Telescope",
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "查找文件",
    },
    {
      "<leader>fo",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "最近文件",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "全文搜索",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "查找缓冲区",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "查找帮助",
    },
    { "<leader>bm", "<cmd>Telescope vim_bookmarks all<cr>", desc = "查找书签" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "tom-anders/telescope-vim-bookmarks.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = "► ",
      },
      pickers = {},
    })

    telescope.load_extension("vim_bookmarks")
  end,
}
