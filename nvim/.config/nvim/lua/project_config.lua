local function find_pattern(pattern)
	local current_dir = vim.fn.getcwd()

	while current_dir ~= "/" do
		local config_path = current_dir .. "/" .. pattern
		if vim.fn.isdirectory(config_path) == 1 then
			return config_path
		end
		current_dir = vim.fn.fnamemodify(current_dir, ":h")
	end

	return nil
end

local project_config = find_pattern(".nvim")
if project_config then
	vim.opt.runtimepath:append(project_config)
end
