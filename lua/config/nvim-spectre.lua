local status_ok, spectre = pcall(require, 'spectre')
if not status_ok then
  return
end

spectre.setup()

vim.cmd([[
  nnoremap <leader>S :lua require('spectre').open()<CR>
  nnoremap <leader>sp viw:lua require('spectre').open_file_search()<CR>
  nnoremap <leader>sw :lua require('spectre').open_visual({ select_word = true })<CR>
]])
