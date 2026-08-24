return {
  "neovim/nvim-lspconfig",
  cond = not vim.g.vscode,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
      opts = {
        ensure_installed = { "lua_ls", "ts_ls", "eslint", "gopls", "rust_analyzer", "vue_ls" },
        -- rustaceanvim 会单独管理 rust-analyzer，避免启动两个客户端。
        automatic_enable = { exclude = { "rust_analyzer" } },
      },
    },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = { border = "rounded" },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
        end

        map("K", "<cmd>Lspsaga hover_doc<cr>", "LSP 悬浮文档")
        map("gh", "<cmd>Lspsaga hover_doc<cr>", "LSP 悬浮文档")
        map("gd", "<cmd>Telescope lsp_definitions theme=dropdown<cr>", "跳转到定义")
        map("gt", "<cmd>Lspsaga goto_type_definition<cr>", "跳转到类型定义")
        map("fr", "<cmd>Telescope lsp_references<cr>", "查找引用")
        map("<leader>e", "<cmd>Lspsaga show_line_diagnostics<cr>", "显示行诊断")
        map("<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", "上一个诊断")
        map("<leader>]", "<cmd>Lspsaga diagnostic_jump_next<cr>", "下一个诊断")
        map("<leader>rn", "<cmd>Lspsaga rename<cr>", "重命名符号")
        map("<leader>ca", "<cmd>Lspsaga code_action<cr>", "代码操作")
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    local servers = {
      ts_ls = {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      },
      vue_ls = {
        filetypes = { "vue" },
      },
      angularls = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.env.VIMRUNTIME] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      },
      vimls = {},
      bashls = {},
      gopls = {},
      eslint = {
        settings = {
          workingDirectory = { mode = "auto" },
        },
      },
      stylelint_lsp = {
        filetypes = { "css", "less", "scss" },
        settings = {
          stylelintplus = {
            autoFixOnSave = true,
            autoFixOnFormat = true,
          },
        },
      },
    }

    if (vim.uv or vim.loop).fs_stat(vue_language_server_path) then
      servers.ts_ls.init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      }
    end

    for server, config in pairs(servers) do
      vim.lsp.config(server, vim.tbl_deep_extend("force", { capabilities = capabilities }, config))
    end
  end,
}
