return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
			'mrcjkb/rustaceanvim',
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-golang"), -- Registration
					require("rustaceanvim.neotest"),
				},
				icons = {
					-- expanded = "",
					-- child_prefix = "",
					-- child_indent = "",
					-- final_child_prefix = "",
					-- non_collapsible = "",
					-- collapsed = "",

					passed = "",
					running = "",
					failed = "",
					unknown = ""
				},
			})
		end,
		keys = {
			{ "<leader>tr", "<cmd>Neotest run<cr>",          desc = "Neotest: Run test" },
			{ "<leader>ts", "<cmd>Neotest summary<cr>",      desc = "Neotest: Toggle summary panel" },
			{ "<leader>to", "<cmd>Neotest output-panel<cr>", desc = "Neotest: Toggle output panel" },
		},
	},
}
