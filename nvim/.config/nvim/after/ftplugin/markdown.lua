vim.wo.wrap = true
vim.o.lbr = true
vim.o.breakindent = true
vim.opt.breakindentopt = { 'list:-1', 'sbr' }

vim.o.ai = true

vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', 'j', 'gj', { buffer = true })
vim.keymap.set('n', 'k', 'gk', { buffer = true })
vim.keymap.set('n', 'H', 'g^', { buffer = true })
vim.keymap.set('n', 'L', 'g$', { buffer = true })

vim.o.cursorlineopt = 'screenline'
