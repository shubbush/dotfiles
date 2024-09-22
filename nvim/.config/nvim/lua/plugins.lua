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

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
	{ text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
	{ text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
	{ text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
	{ text = "󰌵", texthl = "DiagnosticSignHint" })

require("lazy").setup({
	-- GUI enhancements
	'norcalli/nvim-colorizer.lua',
	'folke/zen-mode.nvim',
	--'tpope/vim-vinegar',
	'tpope/vim-unimpaired',
	'romainl/vim-qf',
	'nvim-tree/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	'rktjmp/lush.nvim',
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		init = function()
			vim.api.nvim_create_autocmd('BufEnter', {
				-- make a group to be able to delete it later
				group = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true }),
				callback = function()
					local f = vim.fn.expand('%:p')
					if vim.fn.isdirectory(f) ~= 0 then
						vim.cmd('Neotree current dir=' .. f)
						-- neo-tree is loaded now, delete the init autocmd
						vim.api.nvim_clear_autocmds { group = 'NeoTreeInit' }
					end
				end
			})
		end,
		keys = {
			{ "-", "<cmd>Neotree toggle<cr>",        desc = "Toggle Neotree" },
			{ "_", "<cmd>Neotree reveal toggle<cr>", desc = "Toggle Neotree" },
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = false,
				enable_git_status = true,
				enable_diagnostics = true,
				window = {
					position = "current",
				},
				filesystem = {
					hijack_netrw_behavior = "open_default",
				},
			})
		end
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
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		}
	},
	{
		'scalameta/nvim-metals',
		dependencies = { "nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap" }
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
		dependencies = {

		}
	},

	-- Themes
	"projekt0n/github-nvim-theme",
	"rose-pine/neovim",
	"MeanderingProgrammer/markdown.nvim",

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
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
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
})
