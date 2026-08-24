return {
  {
    "https://codeberg.org/andyg/leap.nvim.git",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap 跳转" },
      { "S", mode = "n", desc = "跨窗口 Leap 跳转" },
    },
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
      vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
    end,
  },
}
