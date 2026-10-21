local opt = vim.opt

-- UI
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 7

-- Colorscheme
vim.cmd.colorscheme("aeternal")

-- Line Nums
opt.number = true
opt.relativenumber = true

-- Indents
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = -1
opt.shiftround = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitbelow = true
opt.splitright = true
