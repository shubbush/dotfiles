--- Bootstrap lazy.nvim ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
---

require("lazy").setup({
	-- GUI enhancements
	{
		'folke/zen-mode.nvim',
		opts = {
			window = {
				width = 0.75,
			},
		}
	},
	'tpope/vim-vinegar',
	'tpope/vim-unimpaired',
	'romainl/vim-qf',
	'nvim-tree/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		}
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
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

	--LSP
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		}
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		}
	},
	{
		'scalameta/nvim-metals',
		dependencies = { "nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap" }
	},

	-- Themes
	"projekt0n/github-nvim-theme",

	{
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				-- config
				config = {
					header = {
						"neovim"
					},
					footer = {}
				}
			}
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
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
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end
	},
	"github/copilot.vim",
	"xiyaowong/telescope-emoji.nvim"
})
