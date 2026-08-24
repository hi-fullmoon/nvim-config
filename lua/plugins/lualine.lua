return {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
            shorting_target = 40,
          },
        },
      },
    })
  end,
}
