return {
  'JoosepAlviste/nvim-ts-context-commentstring',
  cond = not vim.g.vscode,
  config = function()
    vim.g.skip_ts_context_commentstring_module = true
    require('ts_context_commentstring').setup{}
  end
}
