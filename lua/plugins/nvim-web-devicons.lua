return {
  "nvim-tree/nvim-web-devicons",
  cond = not vim.g.vscode,
  lazy = true,
  opts = {
    override_by_filename = {
      [".prettierrc"] = {
        icon = "",
        color = "#fff2f2",
        name = "PrettierConfig",
      },
    },
  },
}
