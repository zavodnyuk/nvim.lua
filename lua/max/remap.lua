vim.g.mapleader = " "
vim.keymap.set("n", "<leader>op", vim.cmd.Ex)
vim.keymap.set("n", ";;", ":")vim.keymap.set("n", ";;", ":")
vim.keymap.set("n", "nh", ":noh<CR>")vim.keymap.set("n", ";;", ":")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

