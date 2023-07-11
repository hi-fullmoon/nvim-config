local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', 'tt', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>t', ':NvimTreeFocus<CR>', opts)

nvim_tree.setup {
  view = {
    width = 40,
    side = 'left',
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    special_files = {}
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = { '^\\.git$', '^\\.idea', '^\\.vscode', '^\\.DS_Store' },
    exclude = {},
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    ignore = false,
  },
}

