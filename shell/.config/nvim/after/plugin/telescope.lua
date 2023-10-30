local telescope = require('telescope')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fG', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup {
	extensions = {
		file_browser = {
      theme = "ivy",
			hijack_netrw = true
		}
	}
}


-- LSP
vim.keymap.set("n", "gws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
