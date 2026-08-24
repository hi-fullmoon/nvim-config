local keymap = vim.keymap.set
local opts = { silent = true }

keymap("i", "jk", "<esc>", vim.tbl_extend("force", opts, { desc = "退出插入模式" }))

keymap("n", "<C-u>", "6k", opts)
keymap("n", "<C-d>", "6j", opts)

keymap("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "聚焦左侧窗口" }))
keymap("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "聚焦右侧窗口" }))
keymap("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "聚焦下方窗口" }))
keymap("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "聚焦上方窗口" }))

keymap("n", "<C-Up>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("i", "<C-s>", "<esc><cmd>write<cr>", vim.tbl_extend("force", opts, { desc = "保存文件" }))
keymap("n", "<C-s>", "<cmd>write<cr>", vim.tbl_extend("force", opts, { desc = "保存文件" }))

keymap("n", "W", "<cmd>write<cr>", vim.tbl_extend("force", opts, { desc = "保存文件" }))
keymap("n", "Q", "<cmd>quit<cr>", vim.tbl_extend("force", opts, { desc = "退出窗口" }))

keymap("n", "K", "<Nop>", opts)
