local autosaveGroup = vim.api.nvim_create_augroup('autosave', { clear = true })

vim.api.nvim_create_autocmd({ 'BufLeave', 'InsertLeave', 'CursorHold' }, {
	pattern = '*',
	group = autosaveGroup,
	command = 'silent! update'
})

vim.api.nvim_create_autocmd({ 'FocusLost' }, {
	pattern = '*',
	group = autosaveGroup,
	command = 'silent! wa'
})
