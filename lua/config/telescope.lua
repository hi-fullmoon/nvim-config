local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', ':Telescope vim_bookmarks all<CR>', {})

telescope.load_extension('flutter')
telescope.load_extension('vim_bookmarks')

telescope.setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = '► ',
  },
  pickers = {}
})
