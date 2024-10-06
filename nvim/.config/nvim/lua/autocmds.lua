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

function FormatAndEnableDiagnostics()
	vim.lsp.buf.format()
	-- to fix issue when diagnostics disappear after formatting
	-- see https://github.com/neovim/neovim/issues/25014#issuecomment-2312672119
	vim.diagnostic.enable(bufnr)
end

-- format on save
local formatOnSave = vim.api.nvim_create_augroup('autoformat', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	pattern = '*',
	group = formatOnSave,
	command = 'lua FormatAndEnableDiagnostics()'
})


-- when directory is opened set it as the current working directory
function SetWorkingDir()
	local path = vim.fn.argv(0)
	if vim.fn.isdirectory(path) == 1 then
		vim.fn.chdir(path)
	end
end

local setWorkingDir = vim.api.nvim_create_augroup('setworkingdir', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	pattern = '*',
	group = setWorkingDir,
	command = 'lua SetWorkingDir()'
})
