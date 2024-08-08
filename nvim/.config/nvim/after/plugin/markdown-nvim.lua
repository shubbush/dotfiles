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
		highlight = '@MdQuoteHighlight',
	},
})

require('render-markdown').enable()
