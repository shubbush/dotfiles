-- Doom style status line
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
	bg       = '#F3F5F7',
	fg       = '#454545',
	yellow   = '#f39c11',
	cyan     = '#008080',
	darkblue = '#2F4858',
	green    = '#00674F',
	orange   = '#E25303',
	violet   = '#724D8D',
	magenta  = '#B03D80',
	blue     = '#3D507B',
	red      = '#D24545',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local win_bar_config = {
	lualine_x = {
		{ 'filetype', icon_only = true, padding = 0 },
		{ 'filename', path = 1,         padding = { left = 0, right = 1 } }
	}
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = '',
		-- component_separators = { left = '|', right = '|' },
		section_separators = '',
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
		globalstatus = true
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	winbar = win_bar_config,
	inactive_winbar = win_bar_config
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left {
	-- mode component
	function()
		return ''
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.green,
			i = colors.blue,
			v = colors.violet,
			[''] = colors.violet,
			V = colors.violet,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[''] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			['r?'] = colors.cyan,
			['!'] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { left = 1, right = 1 },
}


ins_left {
	'filename',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.fg, gui = 'bold' },
}

ins_left {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	symbols = { error = ' ', warn = ' ', info = ' ' },
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.yellow },
		info = { fg = colors.blue },
	},
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
	function()
		return '%='
	end,
}


-- Add components to right sections

ins_right {
	'branch',
	icon = '',
	color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
	'diff',
	-- Is it me or the symbol for modified us really weird
	symbols = { added = ' ', modified = ' ', removed = ' ' },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.blue },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
}

ins_right { 'location' }
ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }

local function get_lsp_status_color()
	local buf_ft = vim.bo.filetype
	local clients = vim.lsp.get_clients()
	local color = colors.red
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			color = colors.green
		end
	end
	return { fg = color, gui = 'bold' }
end


ins_right {
	function()
		return ' '
	end,
	color = get_lsp_status_color
}



-- Now don't forget to initialize lualine
lualine.setup(config)
