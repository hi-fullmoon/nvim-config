let mapleader = ' '

let g:loaded_illuminate = 0

set clipboard=unnamedplus

lua require('config.comment')

autocmd InsertLeave * :silent !/usr/local/bin/macism com.apple.keylayout.ABC

augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

nnoremap % <Cmd>call VSCodeCall('editor.action.jumpToBracket')<CR>
nnoremap <leader>rn <Cmd>call VSCodeCall('editor.action.rename')<CR>
nnoremap <leader>ca <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nnoremap <leader>q <Cmd>call VSCodeCall('workbench.action.closeWindow')<CR>
nnoremap <leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>fg <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
