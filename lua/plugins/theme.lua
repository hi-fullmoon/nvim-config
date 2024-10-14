return {
  'mhartington/oceanic-next',
  cond = not vim.g.vscode,
  config = function()
    vim.cmd [[colorscheme OceanicNext]]

    vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi FloatBorder guibg=NONE ctermbg=NONE
      hi CursorLineNr term=NONE cterm=NONE guifg=#d8dee9
      hi VertSplit guifg=#343d46 guibg=#343d46
    ]]
  end
}
