local status_ok, flutter_tools = pcall(require, 'flutter-tools')
if not status_ok then
  return
end

flutter_tools.setup({
  widget_guides = {
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,         -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true,      -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false,     -- highlight the foreground
      virtual_text = true,    -- show the highlight using virtual text
      virtual_text_str = '',  -- the virtual text character to highlight
    },
    on_attach = function(client)
      require('illuminate').on_attach(client)
    end,
  },
})
