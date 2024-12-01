require 'plugins/lsp/lsp-zero'

return {
	'j-hui/fidget.nvim',
	{
		'VonHeikemen/lsp-zero.nvim',
		lazy = false,
		branch = 'v4.x',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			'nvim-telescope/telescope.nvim',
			'SmiteshP/nvim-navic',
		},
		config = setupLspZero,
	},

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("lsp-file-operations").setup {
				debug = true
			}
		end,
	},
}


--{
--	'mrcjkb/rustaceanvim',
--	version = '^5', -- Recommended
--	lazy = false, -- This plugin is already lazy
--},
