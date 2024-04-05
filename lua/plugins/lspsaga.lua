return {
  'nvimdev/lspsaga.nvim',
  cond = not vim.g.vscode,
  config = function()
    local lspsaga = require('lspsaga')

    lspsaga.setup({
      ui = {
        title = false,
        incoming = "",
        outgoing = "",
        hover = '',
      },
      scroll_preview = {
        scroll_up = '<C-u>',
        scroll_down = '<C-d>',
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      rename = {
        in_select = false,
      },
      implement = {
        enable = false
      }
    })
  end
}
