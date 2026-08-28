return {
  "akinsho/toggleterm.nvim",
  cond = not vim.g.vscode,
  cmd = { "ToggleTerm", "TermExec" },
  keys = { { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "切换浮动终端" } },
  config = function()
    local function set_terminal_keymaps(term)
      local opts = { buffer = term.bufnr, silent = true }
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
    end

    require("toggleterm").setup({
      size = 12,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      persist_mode = false,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      on_open = set_terminal_keymaps,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end,
}
