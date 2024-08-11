vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save buffer' })

-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move hl line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move hl line up' })

-- Keep cursor in the middle while scrolling up and down
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")

-- Search results stay in the middle
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

-- Paste and keep copied text in register
vim.keymap.set('x', "<leader>p", "\"_dP")

vim.keymap.set('n', "<leader>y", "\"+y")
vim.keymap.set('v', "<leader>y", "\"+y")
vim.keymap.set('n', "<leader>Y", "\"+Y")

vim.keymap.set('n', "<leader>d", "\"_d")
vim.keymap.set('v', "<leader>d", "\"_d")

vim.keymap.set('n', "Q", "<nop>")

-- Switch buffers with arrows
vim.keymap.set('n', "<Left>", "<cmd>bp<CR>")
vim.keymap.set('n', "<Right>", "<cmd>bn<CR>")

-- Toggle zen mode
vim.api.nvim_set_keymap(
	"n",
	"<leader>zm",
	":ZenMode<CR>",
	{ noremap = true }
)

-- LSP
vim.keymap.set("n", "gD", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
-- vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Diagnostics
-- all workspace diagnostics
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
vim.keymap.set("n", "<leader>ae", function()
	vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
vim.keymap.set("n", "<leader>aw", function()
	vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

-- current line diagnostics only
vim.keymap.set("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>')

vim.keymap.set("n", "[c", function()
	vim.diagnostic.goto_prev({ wrap = false })
end)

vim.keymap.set("n", "]c", function()
	vim.diagnostic.goto_next({ wrap = false })
end)
