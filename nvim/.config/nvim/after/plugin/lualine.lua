require('lualine').setup({
  options = {
		icons_enabled = true,
    theme = 'onelight',
		component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
	},
	sections = {
    lualine_y =  {'g:metals_status'}
	}
})
