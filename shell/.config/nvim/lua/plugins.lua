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
	'nvim-tree/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
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
	-- Git
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',

	--LSP
  { 'hrsh7th/nvim-cmp', 
	  dependencies = { 
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
  	} 
  },
	{ 'scalameta/nvim-metals',
	  dependencies = {  "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap"} 
	}, 

  -- Themes
  "projekt0n/github-nvim-theme",

	{ 'glepnir/dashboard-nvim',
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
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
	{
		'nvim-orgmode/orgmode',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter', lazy = true },
		}
	},
	'dhruvasagar/vim-table-mode'

})
