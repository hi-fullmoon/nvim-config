return {
  "windwp/nvim-ts-autotag",
  cond = not vim.g.vscode,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })
  end,
}
