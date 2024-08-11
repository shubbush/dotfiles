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
		highlight = '@MdRenderListBullet'
	},
	checkbox = {
		checked = {
			highlight = '@MdCheckboxChecked'
		}
	}
})

require('render-markdown').enable()
