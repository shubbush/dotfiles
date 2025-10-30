require("options")
require("keybindings")
require("plugin_manager")
require("autocmds")
require("notes")
require("lsp")
require("statuscolumn")
require("telescope-config")
require("diagnostic")
require("project_config")

-- disable netrw at the very start of your init.lua. use nvim-tree instead
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

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




require('github-monochrome').setup({
	styles = {
		sidebars = "dark",
		floats = "dark",
	},
	on_colors = function(c, s)
		-- applies to all styles
		-- c.bg = vim.o.background == "light" and c.bg or "#000000"
		c.number = c.purple

		-- applies to 'light' style only
		if s == "light" then
			c.bg = "#F4F4F4"
		end
	end,
	on_highlights = function(hl, c, _)
		-- applies to all styles
		hl.CursorLineNr = { fg = c.fg, bold = true }
	end,
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
