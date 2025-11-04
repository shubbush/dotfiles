return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		opts = {},
		config = function()
			print("Configuring fzf-lua")
			local fzflua = require("fzf-lua")
			fzflua.setup({
				winopts = {
					preview = {
						layout = "vertical",
					},
				},
				files = {
					git_icons = true,
					formatter = "path.filename_first",
				},
				-- fzf_colors = true,
			})


			vim.keymap.set('n', '<C-p>', fzflua.files, { desc = 'FzfLua: Find project files' })
			vim.keymap.set('n', 'g/', fzflua.live_grep, { desc = 'FzfLua: Live grep' })
			vim.keymap.set('n', '<C-\\>', fzflua.buffers, { desc = 'FzfLua: Open buffers' })
			vim.keymap.set('n', '<F1>', fzflua.helptags, { desc = 'FzfLua: Help tags' })
			vim.keymap.set('n', '<C-k>', fzflua.commands, { desc = 'FzfLua: Commands' })
			vim.keymap.set('n', '<C-g>', fzflua.global, { desc = 'FzfLua: Global' })

			-- LSP
			vim.keymap.set("n", "<C-t>", fzflua.lsp_live_workspace_symbols, { desc = 'LSP: Dynamic workspace symbols' })
			vim.keymap.set("n", "<leader>lsd", fzflua.lsp_document_symbols, { desc = 'LSP: Document symbols' })
			vim.keymap.set("n", "<leader>ld", fzflua.lsp_workspace_diagnostics, { desc = 'LSP: Diagnostics' })
			vim.keymap.set("n", "gi", fzflua.lsp_implementations, { desc = 'LSP: Go to implementations' })
			vim.keymap.set("n", "gr", fzflua.lsp_references, { desc = 'LSP: Go to references' })

			-- Git
			vim.keymap.set("n", "<leader>gb", fzflua.git_branches, { desc = 'LSP: Git branches' })
		end
	},
}
