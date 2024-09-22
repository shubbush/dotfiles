return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		init = function()
			vim.api.nvim_create_autocmd('BufEnter', {
				-- make a group to be able to delete it later
				group = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true }),
				callback = function()
					local f = vim.fn.expand('%:p')
					if vim.fn.isdirectory(f) ~= 0 then
						vim.cmd('Neotree current dir=' .. f)
						-- neo-tree is loaded now, delete the init autocmd
						vim.api.nvim_clear_autocmds { group = 'NeoTreeInit' }
					end
				end
			})
		end,
		keys = {
			{ "-", "<cmd>Neotree toggle<cr>",        desc = "Toggle Neotree" },
			{ "_", "<cmd>Neotree reveal toggle<cr>", desc = "Toggle Neotree" },
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = false,
				enable_git_status = true,
				enable_diagnostics = true,
				window = {
					position = "current",
				},
				filesystem = {
					hijack_netrw_behavior = "open_default",
				},
			})
		end
	},
}
