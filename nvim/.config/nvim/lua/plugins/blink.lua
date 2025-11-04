return {
	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = 'enter',

				['<C-h>'] = { 'show_signature', 'hide_signature', 'fallback' },
			},
			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono'
			},
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			cmdline = {
				keymap = { preset = 'super-tab' },
				completion = { menu = { auto_show = true } },
			},

		},
		opts_extend = { "sources.default" }
	}
}
