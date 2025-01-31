return {
	{
		"MeanderingProgrammer/markdown.nvim",
		config = function()
			require("render-markdown").setup({
				heading = {
					enabled = false,
					sign = false,
					width = 'block',
					backgrounds = { 'white' },
				},
				quote = {
					-- Turn on / off block quote & callout rendering
					enabled = true,
					-- Replaces '>' of 'block_quote'
					icon = '┃',
					-- Highlight for the quote icon
					repeat_linebreak = true,
					highlight = '@MdQuoteHighlight',
				},
				bullet = {
					highlight = '@MdRenderListBullet',
					icons = { '', '', '', '' },
				},
				checkbox = {
					checked = {
						highlight = '@MdCheckboxChecked'
					}
				},
				pipe_table = {
					enabled = false,
				}
			})

			require('render-markdown').enable()
		end
	},
	{
		'dhruvasagar/vim-table-mode',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'godlygeek/tabular', lazy = true }
		},
	},
	'preservim/vim-markdown',
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})


			require('peek').setup({
				auto_load = false,     -- whether to automatically load preview when
				-- entering another markdown buffer
				close_on_bdelete = true, -- close preview window on buffer delete

				syntax = true,         -- enable syntax highlighting, affects performance

				theme = 'light',       -- 'dark' or 'light'
				update_on_change = true,
				app = 'browser',       -- 'webview', 'browser'

				filetype = { 'markdown' }, -- list of filetypes to recognize as markdown

				-- relevant if update_on_change is true
				throttle_at = 200000, -- start throttling when file exceeds this
				-- amount of bytes in size
				throttle_time = 'auto', -- minimum amount of time in milliseconds
				-- that has to pass before starting new render
			})
		end,
	},
}
