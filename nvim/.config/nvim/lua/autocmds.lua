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

-- format on save
local formatOnSave = vim.api.nvim_create_augroup('autoformat', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	pattern = '*',
	group = formatOnSave,
	command = 'lua vim.lsp.buf.format()'
})
