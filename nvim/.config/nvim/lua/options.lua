local home_dir = os.getenv("HOME")

vim.opt.clipboard = "unnamedplus"

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.syntax = 'ON'
vim.opt.showmode = false
vim.opt.background = 'light'
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true

-- Spellcheck
vim.opt.spell = true
vim.opt.spellfile = home_dir .. "/.spellfile.utf-8.add"

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Wrap
vim.opt.wrap = true
vim.opt.breakindent = true

-- Tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false


-- Fold
vim.o.foldmethod = "expr"
vim.o.foldlevelstart = 99


-- Scroll
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.opt.updatetime = 50

-- Complete
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- Markdown
-- vim.g.markdown_syntax_conceal = 2
vim.g.markdown_fenced_languages = { 'scala', 'json' }
vim.g.markdown_folding = 1
vim.g.vim_markdown_folding_style_pythonic = 1
vim.g.vim_markdown_no_default_key_mappings = 1
vim.g.vim_markdown_new_list_item_indent = 1
vim.g.vim_markdown_auto_insert_bullets = 1
