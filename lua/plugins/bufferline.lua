return {
  "akinsho/bufferline.nvim",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers",
        numbers = "none",
        separator_style = "thin",
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold,
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
          },
        },
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        show_close_icon = false,
        sort_by = "insert_after_current",
      },
    })

    for index = 1, 6 do
      vim.keymap.set("n", "<leader>" .. index, "<cmd>BufferLineGoToBuffer " .. index .. "<cr>", {
        silent = true,
        desc = "切换到缓冲区 " .. index,
      })
    end

    vim.keymap.set("n", "<leader>cl", "<cmd>BufferLineCloseLeft<cr>", { desc = "关闭左侧缓冲区" })
    vim.keymap.set("n", "<leader>cr", "<cmd>BufferLineCloseRight<cr>", { desc = "关闭右侧缓冲区" })
    vim.keymap.set("n", "<leader>co", "<cmd>BufferLineCloseOthers<cr>", { desc = "关闭其他缓冲区" })
  end,
}
