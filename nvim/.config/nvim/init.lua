require("options")
require("keybindings")
require("plugin_manager")
require("autocmds")
require("notes")
require("lsp")
require("statuscolumn")
require("telescope-config")
require("diagnostic")

-- disable netrw at the very start of your init.lua. use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Theme
vim.o.termguicolors = true
require('github-theme').setup({
	options = {
		styles = {
			terminal_colors = true,
			comments = 'italic',
		},
		darken = {
			sidebars = {
				enable = true,
				list = {}, -- Apply dark background to specific windows
			},
		}
	}
})
vim.cmd.colorscheme('github_light')


require("hl_groups")

require('gitsigns').setup()

vim.cmd [[
	augroup highlight_yank
	    autocmd!
 	    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
	augroup END
]]

vim.filetype.add({ extension = { hurl = 'hurl' } })
