return {
  'nvim-treesitter/nvim-treesitter',
  cond = not vim.g.vscode,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function ()
    require('nvim-treesitter.configs').setup({
      auto_install = false,
      ensure_installed = {
        -- 'html', 'css', 'vim', 'vue', 'lua', 'javascript', 'typescript',
        -- 'tsx', 'c', 'rust', 'go', 'json', 'dart', 'markdown', 'markdown_inline'
      },
      matchup = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
    })
  end
}
