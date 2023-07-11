local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
  return
end

saga.setup({
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
