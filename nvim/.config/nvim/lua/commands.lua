local notes = '~/notes/inbox/'
vim.api.nvim_create_user_command(
	'Zet',
	function(opts)
		local filename
		local args = opts.fargs
		if (#args == 0) then
			filename = ''
		else
			filename = args[1]:gsub("[\n\r]", '')
		end
		if filename == nil or filename == '' then
			local now = os.date('%Y-%m-%d_%H%M%S')
			filename = 'note_' .. now
		end
		vim.cmd('e ' .. notes .. filename .. '.md')
	end,
	{ nargs = '?' }
)
