local status_ok, formatter = pcall(require, 'formatter')
if not status_ok then
  return
end

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
      try_node_modules = true,
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
      require('formatter.filetypes.html').prettier,
    },

    css = {
      require('formatter.filetypes.css').prettier,
    },

    json = {
      require('formatter.filetypes.json').prettier,
    },

    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },

    javascriptreact = {
      require('formatter.filetypes.javascriptreact').prettier,
    },

    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },

    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },

    yaml = {
      require('formatter.filetypes.yaml').prettier,
    },

    less = {
      localFormatter,
    },

    scss = {
      localFormatter,
    },

    -- any filetype
    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace
    }
  }
}
