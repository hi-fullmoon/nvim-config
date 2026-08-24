return {
  "L3MON4D3/LuaSnip",
  cond = not vim.g.vscode,
  version = "v2.*",
  lazy = true,
  config = function()
    local ls = require("luasnip")

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    local log = s("log", {
      t("console.log("),
      i(1, ""),
      t(")"),
    })

    for _, filetype in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }) do
      ls.add_snippets(filetype, { log })
    end
  end,
}
