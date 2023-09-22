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
  }

})
