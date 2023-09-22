require("options")
require("keybindings")
require("plugins")


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
        enabled = false,
        list = {},             -- Apply dark background to specific windows
      },
    }
  }
})
vim.cmd'colorscheme github_light'

require('lualine').setup({
  options = {
		icons_enabled = false,
    theme = 'onelight',
		component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
	}
})

require'nvim-treesitter.configs'.setup {
 ensure_installed = { "lua" },
 highlight = {
   enable = true
 }
}

vim.cmd [[
	augroup highlight_yank
	    autocmd!
 	    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
	augroup END
]]
