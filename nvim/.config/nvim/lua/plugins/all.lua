return {
	-- GUI enhancements
	'norcalli/nvim-colorizer.lua',
	--'tpope/vim-vinegar',
	'tpope/vim-unimpaired',
	'romainl/vim-qf',
	'nvim-tree/nvim-web-devicons',
	'rktjmp/lush.nvim',
	'j-hui/fidget.nvim',
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
	-- Git
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	'tpope/vim-rhubarb',
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			--		"nvim-telescope/telescope.nvim", -- optional
			--		"ibhagwan/fzf-lua",            -- optional
			--		"echasnovski/mini.pick",       -- optional
		},
		config = true
	},
	--LSP
	{
		"williamboman/mason.nvim",
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
		},
	},
	{
		'williamboman/mason-lspconfig.nvim',
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- Themes
	"projekt0n/github-nvim-theme",
	"rose-pine/neovim",

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end
	},
	"github/copilot.vim",
	"xiyaowong/telescope-emoji.nvim",
	'tpope/vim-commentary',
	'fei6409/log-highlight.nvim'
}
