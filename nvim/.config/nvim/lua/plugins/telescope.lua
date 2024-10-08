return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local telescope = require('telescope')
			local builtin = require('telescope.builtin')
			local telescopeConfig = require("telescope.config")

			vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})
			vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

			vim.keymap.set('n', '<leader>;', builtin.commands, {})

			-- extensions
			telescope.load_extension("emoji")

			-- Clone the default Telescope configuration
			local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

			-- I want to search in hidden/dot files.
			table.insert(vimgrep_arguments, "--hidden")
			-- I don't want to search in the `.git` directory.
			table.insert(vimgrep_arguments, "--glob")
			table.insert(vimgrep_arguments, "!**/.git/*")

			telescope.setup {
				defaults = {
					-- `hidden = true` is not supported in text grep commands.
					vimgrep_arguments = vimgrep_arguments,
					path_display = { "smart" },
				},
				pickers = {
					find_files = {
						-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
					lsp_references = {
						theme = "cursor",
					},
				},
			}

			-- LSP
			vim.keymap.set("n", "<leader>P", builtin.lsp_dynamic_workspace_symbols)
			vim.keymap.set("n", "<leader>lsd", builtin.lsp_document_symbols)
			vim.keymap.set("n", "<leader>ld", builtin.diagnostics)
		end
	}
}
