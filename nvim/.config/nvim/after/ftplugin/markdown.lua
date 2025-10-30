vim.wo.wrap = true
vim.o.lbr = true
vim.o.breakindent = true
vim.opt.breakindentopt = { 'list:-1', 'sbr' }

vim.o.ai = true

vim.keymap.set('', 'H', '^', { desc = 'Jump to start of line' })
vim.keymap.set('', 'L', '$', { desc = 'Jump to end of line' })

vim.keymap.set('n', 'j', 'gj', { buffer = true, desc = 'Move down by screen line' })
vim.keymap.set('n', 'k', 'gk', { buffer = true, desc = 'Move up by screen line' })
vim.keymap.set('n', 'H', 'g^', { buffer = true, desc = 'Jump to screen line start' })
vim.keymap.set('n', 'L', 'g$', { buffer = true, desc = 'Jump to screen line end' })

vim.o.cursorlineopt = 'screenline'
vim.opt.conceallevel = 0
