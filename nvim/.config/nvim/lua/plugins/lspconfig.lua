return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		},
		config = function()
			-- require 'lspconfig'.nil_ls.setup {
			-- 	settings = {
			-- 		['nil'] = {
			-- 			formatting = {
			-- 				command = { "nixpkgs-fmt" },
			-- 			},
			-- 		},
			-- 	},
			-- }
		end
	}
}
