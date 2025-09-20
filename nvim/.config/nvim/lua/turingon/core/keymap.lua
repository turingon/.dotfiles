--Essentials
vim.keymap.set("n", "E", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<ESC>")

--Window Navigation
vim.keymap.set("n", "<leader>wa", "<C-w>h")
vim.keymap.set("n", "<leader>wd", "<C-w>j")
vim.keymap.set("n", "<leader>ws", "<C-w>k")
vim.keymap.set("n", "<leader>wf", "<C-w>l")

-- No Arrow Key
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "i" }, "<ESC>", "<Nop>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines
vim.keymap.set("n", "J", "mzJ`z")

--Navigation Center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Yanking Global
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>o", function()
  vim.lsp.buf.format()
end)
