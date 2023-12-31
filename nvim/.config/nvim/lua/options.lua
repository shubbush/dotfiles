vim.opt.clipboard = "unnamedplus"

-- UI
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.laststatus=2
vim.opt.syntax='ON'
vim.opt.showmode=false
vim.opt.background = 'light'
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true


-- Search
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true

-- Wrap
vim.opt.wrap = true
vim.opt.breakindent = true

-- Tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false


-- Fold
vim.o.foldmethod = "expr"
vim.o.foldlevelstart=99


-- Scroll
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.opt.updatetime = 50

-- Complete
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

