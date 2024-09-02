return {
  'stevearc/conform.nvim',
  opts = {},
  cond = not vim.g.vscode,
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        lua             = { 'stylua' },
        python          = { 'isort', 'black' },
        rust            = { 'rustfmt', lsp_format = 'fallback' },
        javascript      = { 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier', stop_after_first = true },
        typescript      = { 'prettier', stop_after_first = true },
        typescriptreact = { 'prettier', stop_after_first = true },
        vue             = { 'prettier', stop_after_first = true },
        css             = { 'prettier', stop_after_first = true },
        less            = { 'prettier', stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'fallback',
      },
    })
  end,
}
