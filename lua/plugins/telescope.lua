return {
  'nvim-telescope/telescope.nvim',
  cond = not vim.g.vscode,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim'
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.load_extension('vim_bookmarks')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>bm', ':Telescope vim_bookmarks all<CR>', {})

    telescope.setup({
      defaults = {
        prompt_prefix = ' ',
        selection_caret = '► ',
      },
      pickers = {}
    })
  end
}
