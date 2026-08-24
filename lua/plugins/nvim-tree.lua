return {
  {
    'nvim-tree/nvim-tree.lua',
    cond = not vim.g.vscode,
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    keys = {
      { "tt", "<cmd>NvimTreeToggle<cr>", desc = "切换文件树" },
      { "<leader>t", "<cmd>NvimTreeFocus<cr>", desc = "聚焦文件树" },
    },
    config = function()
      require('nvim-tree').setup {
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
    end
  }
}
