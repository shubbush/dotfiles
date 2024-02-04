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
-- vim.cmd.colorscheme('github_light')
require('github-theme').setup({
  options = {
    styles = {
      terminal_colors = true,
      comments = 'italic',
    },
		darken = {
      sidebars = {
        enabled = true,
        list = {},             -- Apply dark background to specific windows
      },
    }
  }
})
vim.cmd'colorscheme github_light'

require('lualine').setup({
  options = {
		icons_enabled = true,
    theme = 'onelight',
		component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
	},
	sections = {
    lualine_y =  {'g:metals_status'}
	}
})

-- Load treesitter grammar for org
require('orgmode').setup_ts_grammar()


-- Setup orgmode
require('orgmode').setup({
	org_agenda_files = '~/todo/*',
	org_todo_keywords = { "TODO(t)", "|", "DONE", "CANCELED" },
	org_todo_keyword_faces = {
			TODO = ':foreground #00605f :weight semi-bold',
			DONE = ':foreground #000000'
	},
	org_ellipsis = '⬎'
})

require('gitsigns').setup()

vim.cmd [[
	augroup highlight_yank
	    autocmd!
 	    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
	augroup END
]]

vim.filetype.add( { extension = { hurl = 'hurl' } })
