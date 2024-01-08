require'nvim-treesitter.configs'.setup {
  ensure_installed = { "vimdoc", "lua", "c", "vim", "vimdoc", "query", "scala", "json", "org", "hurl"},
  highlight = {
	  enable = true,
	  additional_vim_regex_highlighting = { 'org' }
  },
}

vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
