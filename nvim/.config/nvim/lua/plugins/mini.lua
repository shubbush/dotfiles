return {
	{
		'echasnovski/mini.surround',
		version = '*',
		enabled = false,
		config = function()
			require('mini.surround').setup()
		end
	},
	{
		'echasnovski/mini.pairs',
		version = '*',
		config = function()
			require('mini.pairs').setup()
		end
	},
}