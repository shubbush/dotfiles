local fn = vim.fn
local fc = vim.opt.fillchars:get()

local function get_fold(lnum)
	if fn.foldlevel(lnum) <= fn.foldlevel(lnum - 1) then return ' ' end
	return fn.foldclosed(lnum) == -1 and fc.foldopen or fc.foldclose
end

_G.get_statuscol = function()
	if vim.opt_local.signcolumn:get() == 'yes' then
		return "%s%= " .. get_fold(vim.v.lnum) .. " "
	else
		return ""
	end
end
