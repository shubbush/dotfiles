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
		'kevinhwang91/nvim-ufo',
		dependencies = { 'kevinhwang91/promise-async' },
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
			local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
			for _, ls in ipairs(language_servers) do
				require('lspconfig')[ls].setup({
					capabilities = capabilities
					-- you can add other fields for setting up lsp server in this table
				})
			end
			require('ufo').setup({
				close_fold_kinds_for_ft = {
					default = { 'imports' },
				},
			})
		end,
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
