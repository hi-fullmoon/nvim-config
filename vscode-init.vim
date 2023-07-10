let mapleader = ' '

let g:loaded_illuminate = 0

set clipboard=unnamedplus

lua require('config.comment')

autocmd InsertLeave * :silent !/usr/local/bin/macism com.apple.keylayout.ABC

augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

nnoremap W <Cmd>call VSCodeCall('workbench.action.files.save')<CR>
nnoremap Q <Cmd>call VSCodeCall('workbench.action.closeActiveEditor')<CR>
nnoremap <leader>t <Cmd>call VSCodeCall('workbench.explorer.fileView.focus')<CR>

nnoremap <leader>1 <Cmd>call VSCodeCall('workbench.action.openEditorAtIndex1')<CR>
nnoremap <leader>2 <Cmd>call VSCodeCall('workbench.action.openEditorAtIndex2')<CR>
nnoremap <leader>3 <Cmd>call VSCodeCall('workbench.action.openEditorAtIndex3')<CR>
nnoremap <leader>4 <Cmd>call VSCodeCall('workbench.action.openEditorAtIndex4')<CR>
nnoremap <leader>5 <Cmd>call VSCodeCall('workbench.action.openEditorAtIndex5')<CR>
nnoremap <leader>6 <Cmd>call VSCodeCall('workbench.action.openEditorAtIndex5')<CR>

nnoremap % <Cmd>call VSCodeCall('editor.action.jumpToBracket')<CR>
nnoremap <leader>rn <Cmd>call VSCodeCall('editor.action.rename')<CR>
nnoremap <leader>ca <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nnoremap <leader>q <Cmd>call VSCodeCall('workbench.action.closeActiveEditor')<CR>
nnoremap <leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>fg <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
