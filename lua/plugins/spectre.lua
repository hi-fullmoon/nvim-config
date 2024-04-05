return {
  'windwp/nvim-spectre',
  cond = not vim.g.vscode,
  config = function()
    require('spectre').setup()

    vim.cmd([[
      nnoremap <leader>S :lua require('spectre').open()<CR>
      nnoremap <leader>sp viw:lua require('spectre').open_file_search()<CR>
      nnoremap <leader>sw :lua require('spectre').open_visual({ select_word = true })<CR>
    ]])
  end
}
