vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

vim.keymap.set('n', '*', '*zz', {desc = 'Search and center screen'})

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {desc = 'Move hl line down'})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {desc = 'Move hl line up'})

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


-- Telescope file browser
vim.api.nvim_set_keymap(
  "n",
  "<leader>ft",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>fc",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
