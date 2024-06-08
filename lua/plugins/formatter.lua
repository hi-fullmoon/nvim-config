return {
  'mhartington/formatter.nvim',
  cond = not vim.g.vscode,
  config = function()
    local formatter = require('formatter')

    local util = require 'formatter.util'

    local function localFormatter(parser)
      if not parser then
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            util.escape_path(util.get_current_buffer_file_path()),
          },
          stdin = true,
          try_node_modules = false,
        }
      end

      return {
        exe = 'prettier',
        args = {
          '--stdin-filepath',
          util.escape_path(util.get_current_buffer_file_path()),
          '--parser',
          parser,
        },
        stdin = true,
        try_node_modules = true,
      }
    end

    formatter.setup {
      logging = true,

      log_level = vim.log.levels.WARN,

      filetype = {
        html = {
          localFormatter,
        },

        css = {
          localFormatter,
        },

        json = {
          localFormatter,
        },

        javascript = {
          localFormatter,
        },

        javascriptreact = {
          localFormatter,
        },

        typescript = {
          localFormatter,
        },

        typescriptreact = {
          localFormatter,
        },

        yaml = {
          require('formatter.filetypes.yaml').prettier,
        },

        vue = {
          localFormatter,
        },

        less = {
          localFormatter,
        },

        scss = {
          localFormatter,
        },

        -- any filetype
        ['*'] = {
          -- require('formatter.filetypes.any').remove_trailing_whitespace
        }
      }
    }
  end
}
