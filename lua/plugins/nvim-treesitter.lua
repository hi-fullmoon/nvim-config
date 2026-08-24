return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      config = function()
        require("nvim-treesitter-textobjects").setup({
          select = {
            lookahead = true,
            include_surrounding_whitespace = true,
          },
        })

        local select = require("nvim-treesitter-textobjects.select").select_textobject
        local textobjects = {
          af = "@function.outer",
          ["if"] = "@function.inner",
          ac = "@class.outer",
          ic = "@class.inner",
        }

        for lhs, query in pairs(textobjects) do
          vim.keymap.set({ "x", "o" }, lhs, function()
            select(query, "textobjects")
          end, { desc = "选择 Treesitter 对象 " .. query })
        end
      end,
    },
  },
  config = function()
    require("nvim-treesitter").setup()

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
      callback = function(args)
        if vim.g.vscode then
          return
        end

        local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(args.buf))
        if stats and stats.size > 100 * 1024 then
          return
        end

        if pcall(vim.treesitter.start, args.buf) then
          -- Treesitter 成功启用后关闭重复的正则语法高亮。
          vim.bo[args.buf].syntax = ""
          if vim.api.nvim_get_current_buf() == args.buf then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end
      end,
      desc = "按文件类型启用 Treesitter 高亮与折叠",
    })
  end,
}
