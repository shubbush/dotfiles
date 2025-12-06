return {
	"rmagatti/auto-session",
	lazy = false,
	dependencies = {
		"nvim-neo-tree/neo-tree.nvim",
	},

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/dev" },
		-- log_level = 'debug',

		no_restore_cmds = {
			function()
				vim.cmd("Neotree current")
			end,
		},
	},
}
