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
        vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>')
        vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', opts)
        -- vim.keymap.set('n', 'gd', ':Telescope lsp_definitions theme=dropdown<CR>', opts)
        -- vim.keymap.set('n', 'gd', ':Lspsaga goto_definition<CR>', opts)
        vim.keymap.set('n', 'gt', ':Lspsaga goto_type_definition theme=dropdown<CR>', opts)
        -- vim.keymap.set('n', 'fr', vim.lsp.buf.references)
        vim.keymap.set('n', 'fr', ':Telescope lsp_references<CR>')
        vim.keymap.set('n', 'gh', ':Lspsaga finder<CR>')
        vim.keymap.set('n', '<leader>e', ':Lspsaga show_line_diagnostics<CR>', opts)
        vim.keymap.set('n', '<leader>[', ':Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', '<leader>]', ':Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', '<leader>rn', ':Lspsaga rename<CR>', opts)
        vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<CR>')
        vim.keymap.set('n', '<leader>ca', ':Telescope quickfix<CR>')
        vim.keymap.set('n', '<leader>ft', ':Format<CR>', opts)
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
