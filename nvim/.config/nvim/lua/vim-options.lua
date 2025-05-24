vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
--vim.o.guicursor ="c:block,n-v-i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.wo.number = true
vim.opt.termguicolors = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nowrap")
vim.cmd("set relativenumber")
vim.cmd("set conceallevel=1")
vim.cmd("let g:tex_conceal='abdmg'")

--Latex Inkscape Commands
vim.cmd("inoremap <C-t> <ESC>:silent exec '!inkscape-figures create '.getline('.')' ./figures/ '<CR><CR>:w<CR> ")
vim.cmd("nnoremap <C-t> :silent exec '!inkscape-figures edit ./figures/ > /dev/null 2>&1 & '<CR><CR>:redraw!<CR>")
--Some Useful Insert Mode Bindings

--Save
vim.cmd("nnoremap <C-s> <Esc>:wa<cr>")
vim.cmd("inoremap <C-s> <c-o>:wa<cr>")

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

--UndoTree Persisten History
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Movement
vim.keymap.set("n", "<leader>wa", "<C-w>h")
vim.keymap.set("n", "<leader>wd", "<C-w>j")
vim.keymap.set("n", "<leader>ws", "<C-w>k")
vim.keymap.set("n", "<leader>wf", "<C-w>l")

--Resize
vim.keymap.set("n", "<leader>rs", ":resize -1<CR>")
vim.keymap.set("n", "<leader>rd", ":resize +1<CR>")
vim.keymap.set("n", "<leader>ra", ":vertical resize -1<CR>")
vim.keymap.set("n", "<leader>rf", ":vertical resize +1<CR>")

--Move Code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--Buffer Movement
vim.keymap.set("n", "<TAB>", ":bn<CR>")
vim.keymap.set("n", "<S-TAB>", ":bp<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>") -- from Doom Emacs
vim.keymap.set("n", "<leader>qb",":bw<CR>")

--Searching
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "<leader>gg", "<leader>b")
