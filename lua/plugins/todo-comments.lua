return {
  'folke/todo-comments.nvim',
  cond = not vim.g.vscode,
  config = function ()
    require('todo-comments').setup({})
  end
}

