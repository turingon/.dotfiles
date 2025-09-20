vim.g.mapleader = " "
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Indentation Settings
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

--Undotree
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


--Search
-- vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
