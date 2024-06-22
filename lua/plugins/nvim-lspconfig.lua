return {
  'neovim/nvim-lspconfig',
  cond = not vim.g.vscode,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets'
  },
  config = function()
    local lspconfig = require('lspconfig')

    local signs = {
      { name = 'DiagnosticSignError', text = '' },
      { name = 'DiagnosticSignWarn',  text = '' },
      { name = 'DiagnosticSignHint',  text = '' },
      { name = 'DiagnosticSignInfo',  text = '' },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        active = signs,
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {},
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }

        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover)
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
        -- vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions theme=dropdown<cr>', opts)
        -- vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
        vim.keymap.set('n', 'gt', '<cmd>Lspsaga goto_type_definition theme=dropdown<cr>', opts)
        -- vim.keymap.set('n', 'fr', vim.lsp.buf.references)
        vim.keymap.set('n', 'fr', '<cmd>Telescope lsp_references<cr>')
        vim.keymap.set('n', 'gh', '<cmd>Lspsaga finder<cr>')
        vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
        vim.keymap.set('n', '<leader>[', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
        vim.keymap.set('n', '<leader>]', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
        -- vim.keymap.set('n', '<leader>e', function () vim.diagnostic.open_float({ border = 'rounded' }) end , opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', opts)
        vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>')
        -- vim.keymap.set('n', '<leader>ca', '<cmd>Telescope quickfix<cr>')
        vim.keymap.set('n', '<leader>ft', '<cmd>Format<cr>', opts)
      end,
    })

    local on_attach = function(client, bufnr)
      local ok, illuminate = pcall(require, 'illuminate')
      if not ok then
        return
      end
      illuminate.on_attach(client)
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local home = os.getenv('HOME')

    lspconfig.tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = home .. '/.nvm/versions/node/v18.15.0/lib/node_modules/@vue/typescript-plugin',
            languages = { 'vue' },
          },
        },
      },
    })

    lspconfig.volar.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'vue' }
    })

    lspconfig.angularls.setup({})

    lspconfig.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.cssls.setup( {
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            },
          },
        },
      },
    })

    lspconfig.vimls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        autoFixOnFormat = true,
      }
    })

    lspconfig.stylelint_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'css', 'less', 'scss' },
      settings = {
        stylelintplus  = {
          -- autoFixOnFormat = true,
          autoFixOnSave = true,
        }
      },
    })
  end
}
