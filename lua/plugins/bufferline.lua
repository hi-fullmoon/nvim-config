return {
  'akinsho/bufferline.nvim',
  cond = not vim.g.vscode,
  priority = 49,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    local bufferline = require('bufferline');
    bufferline.setup({
      options = {
        mode = 'buffers',
        numbers = 'none',
        separator_style = 'thin',
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold
        },
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory'
          }
        },
        diagnostics = "coc",
        diagnostics_update_in_insert = false,
        show_close_icon = false,
        sort_by = 'insert_after_current'
      },
    })

    local opts = { noremap = true, silent = true }

    vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)

    vim.api.nvim_set_keymap('n', '<leader>cl', ':BufferLineCloseLeft<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>cr', ':BufferLineCloseRight<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>co', ':BufferLineCloseOthers<CR>', opts)
  end
}
