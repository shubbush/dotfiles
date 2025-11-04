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
	on_colors = function(c)
		-- modifies the color palette
		c.comment = "#6e7781"
		c.yellow = "#f39c11"
		c.orange = "#BE5103"
		c.red = "#D24545"
		c.purple = "#724D8D"
		c.magenta = "#8B008B"
		c.bg_popup = c.bg_highlight

		return c
	end,
	on_highlights = function(hl, c, _)
		-- applies to all styles
		hl.CursorLineNr         = { fg = c.fg, bold = true }
		hl.Search               = { fg = c.fg }
		hl.MsgArea              = { fg = c.fg }

		-- Neotree
		hl.NeoTreeDirectoryIcon = { fg = c.fg }
		hl.NeoTreeFileName      = { fg = c.fg }
	end,
})
vim.cmd.colorscheme('github-monochrome-light')


require("hl_groups")

require('gitsigns').setup()

vim.cmd [[
	augroup highlight_yank
	    autocmd!
 	    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
	augroup END
]]

vim.filetype.add({ extension = { hurl = 'hurl' } })
