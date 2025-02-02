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
vim.cmd("noremap r d")
vim.cmd("noremap rr dd")
vim.cmd("noremap a h")
vim.cmd("noremap s k")
vim.cmd("noremap d j")
vim.cmd("noremap f l")

--Nord Theme Config
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

--Some Useful Insert Mode Bindings

--Navigate
vim.cmd("inoremap <C-a> <Left>")
vim.cmd("inoremap <C-s> <Up>")
vim.cmd("inoremap <C-d> <Down>")
vim.cmd("inoremap <C-f> <Right>")


--Save 
vim.cmd("inoremap <F3> <c-o>:w<cr>")

--Undo Redo Not Working
vim.cmd("inoremap <C-u> <c-o>:u<cr>")


vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

--Useful Shortcuts
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-x>", ":wqa<CR>")


--UndoTree Persisten History
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Movement
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--Resize
vim.keymap.set("n", "<C-Up>", ":resize -1<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +1<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +1<CR>")

--Move Code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--Buffer Movement
vim.keymap.set("n", "<TAB>", ":bn<CR>")
vim.keymap.set("n", "<S-TAB>", ":bp<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>") -- from Doom Emacs

--Searching
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "<leader>b")
