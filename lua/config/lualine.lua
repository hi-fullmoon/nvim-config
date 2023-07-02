local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup({
  options = {
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
        shorting_target = 40
      }
    },
  },
})
