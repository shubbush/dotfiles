require("md_hl_groups")
require("options")
require("keybindings")
require("plugins")
require("autocmds")
require("commands")

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


require('gitsigns').setup()

vim.cmd [[
	augroup highlight_yank
	    autocmd!
 	    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
	augroup END
]]

vim.filetype.add({ extension = { hurl = 'hurl' } })
