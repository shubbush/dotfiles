return {
	-- Provides a new window that lists open buffers while cycling through buffers
	{
		"ghillb/cybu.nvim",
		config = function()
			local ok, cybu = pcall(require, "cybu")
			if not ok then
				return
			end
			cybu.setup({
				behavior = {
					mode = {
						last_used = {
							switch = "immediate",
							view = "paging",
						}
					}
				}
			})
			vim.keymap.set('n', "<Left>", "<plug>(CybuPrev)", { desc = 'Cybu: Previous buffer' })
			vim.keymap.set('n', "<Right>", "<plug>(CybuNext)", { desc = 'Cybu: Next buffer' })
		end,
	},
}
