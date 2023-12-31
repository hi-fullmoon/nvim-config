local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

packer.init({
  git = {
    default_url_format = 'git@github.com:%s'
  }
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'mhartington/oceanic-next'
  use 'RRethy/vim-illuminate'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/typescript.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use { 'j-hui/fidget.nvim', tag = 'legacy' }
  use 'mhartington/formatter.nvim'
  use 'nvimdev/lspsaga.nvim'

  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'mfussenegger/nvim-dap'
  use 'akinsho/toggleterm.nvim'

  use 'ggandor/leap.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'jlanzarotta/bufexplorer'
  use 'moll/vim-bbye'
  use 'folke/which-key.nvim'
  use 'windwp/nvim-spectre'
  use 'akinsho/flutter-tools.nvim'
  use 'simrat39/rust-tools.nvim'
  use 'ggandor/flit.nvim'
  use 'goolord/alpha-nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'
  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'folke/todo-comments.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'junegunn/vim-easy-align'
  use 'andymass/vim-matchup'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
