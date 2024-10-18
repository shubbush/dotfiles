return {
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = { "vimdoc", "lua", "c", "vim", "vimdoc", "query", "json", "hurl", "markdown", "markdown_inline", "go" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { 'org' }
				},
			}

			-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
		end
	}
}
