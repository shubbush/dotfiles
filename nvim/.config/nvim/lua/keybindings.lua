vim.g.mapleader = ' '

-- Register group names for which-key
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>p', '<nop>', { desc = '+project/paste' })
vim.keymap.set('n', '<leader>v', '<nop>', { desc = '+vim' })
vim.keymap.set('n', '<leader>y', '<nop>', { desc = '+yank' })
vim.keymap.set('n', '<leader>d', '<nop>', { desc = '+debug' })
vim.keymap.set('n', '<leader>z', '<nop>', { desc = '+zen' })

-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^', { desc = 'Jump to start of line' })
vim.keymap.set('', 'L', '$', { desc = 'Jump to end of line' })

vim.keymap.set('n', '*', '*zz', { desc = 'Search and center screen' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move hl line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move hl line up' })

-- Keep cursor in the middle while scrolling up and down
vim.keymap.set('n', "<C-d>", "<C-d>zz", { desc = 'Page down (centered)' })
vim.keymap.set('n', "<C-u>", "<C-u>zz", { desc = 'Page up (centered)' })

-- Search results stay in the middle
vim.keymap.set('n', "n", "nzzzv", { desc = 'Next search result (centered)' })
vim.keymap.set('n', "N", "Nzzzv", { desc = 'Previous search result (centered)' })

-- Paste and keep copied text in register
vim.keymap.set('x', "<leader>p", "\"_dP", { desc = 'Paste without losing clipboard' })

vim.keymap.set('n', "<leader>y", "\"+y", { desc = 'Copy to system clipboard' })
vim.keymap.set('v', "<leader>y", "\"+y", { desc = 'Copy to system clipboard' })
vim.keymap.set('n', "<leader>Y", "\"+Y", { desc = 'Copy line to system clipboard' })

-- vim.keymap.set('n', "<leader>d", "\"_d", { desc = 'Delete without affecting clipboard' })
-- vim.keymap.set('v', "<leader>d", "\"_d", { desc = 'Delete without affecting clipboard' })

vim.keymap.set('n', "Q", "<nop>", { desc = 'Disable Ex mode' })

-- Switch buffers with arrows
vim.keymap.set('n', "<Left>", "<cmd>bp<CR>", { desc = 'Previous buffer' })
vim.keymap.set('n', "<Right>", "<cmd>bn<CR>", { desc = 'Next buffer' })

-- Toggle zen mode
vim.api.nvim_set_keymap(
	"n",
	"<leader>zm",
	":ZenMode<CR>",
	{ noremap = true, desc = 'Toggle zen mode' }
)
