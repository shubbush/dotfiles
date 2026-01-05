return {
	-- GUI enhancements
	"norcalli/nvim-colorizer.lua",
	--'tpope/vim-vinegar',
	"tpope/vim-unimpaired",
	"nvim-tree/nvim-web-devicons",
	"rktjmp/lush.nvim",
	"tpope/vim-rhubarb",
	"lewis6991/gitsigns.nvim",

	-- Themes
	"projekt0n/github-nvim-theme",
	"rose-pine/neovim",
	{
		"idr4n/github-monochrome.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	"github/copilot.vim",
	"xiyaowong/telescope-emoji.nvim",
	"fei6409/log-highlight.nvim",
	"tpope/vim-surround",
	"RRethy/vim-illuminate",
}
