return {
	{
		"NeogitOrg/neogit",
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			--		"nvim-telescope/telescope.nvim", -- optional
			--		"ibhagwan/fzf-lua",            -- optional
			--		"echasnovski/mini.pick",       -- optional
		},
		keys = {
			{ "<leader>gs", "<cmd>Neogit<cr>", desc = "Open Neogit status buffer" },
		},
		config = true,
	},
}
