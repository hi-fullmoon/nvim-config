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
  },
}

local ensure_installed = vim.tbl_keys(servers)
table.insert(ensure_installed, "rust_analyzer")
table.sort(ensure_installed)

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
        ensure_installed = ensure_installed,
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

    local stylelint_group = vim.api.nvim_create_augroup("UserStylelintFix", { clear = true })

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

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.name == "stylelint_lsp" then
          vim.api.nvim_clear_autocmds({ group = stylelint_group, buffer = ev.buf })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = stylelint_group,
            buffer = ev.buf,
            callback = function()
              pcall(vim.cmd, "LspStylelintFixAll")
            end,
            desc = "保存前应用 Stylelint 自动修复",
          })
        end
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

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
