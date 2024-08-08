require("zen-mode").setup({
	window = {
		width = .75, -- width will be 85% of the editor width
		backdrop = 0.5,
	},
	plugins = {
		options = {
			ruler = false,
			laststatus = 1
		}
	}
})

vim.api.nvim_set_hl(0, 'ZenBg', { link = 'bg' })
