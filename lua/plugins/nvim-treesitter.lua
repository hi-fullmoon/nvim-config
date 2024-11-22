return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      disabled = { 'yaml' },
      auto_install = false,
      ensure_installed = {},
      matchup = {
        enable = not vim.g.vscode,
      },
      highlight = {
        enable = not vim.g.vscode,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          node_incremental = "af",
          node_decremental = "ai",
        },
      },
    })
  end
}
