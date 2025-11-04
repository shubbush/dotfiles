return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim'
		},
		enabled = false,
		config = function()
			local telescope = require('telescope')
			local telescopeConfigLua = require('telescope-config')
			local builtin = require('telescope.builtin')
			local telescopeConfig = require("telescope.config")
			local actions = require("telescope.actions")

			vim.keymap.set('n', '<C-p>', "<CMD>lua require'telescope-config'.project_files()<CR>",
				{ desc = 'Telescope: Find project files' })
			vim.keymap.set('n', 'g/', builtin.live_grep, { desc = 'Telescope: Live grep' })
			vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope: Open buffers' })
			vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Telescope: Help tags' })

			vim.keymap.set('n', '<leader>;', builtin.commands, { desc = 'Telescope: Commands' })

			-- extensions
			telescope.load_extension("emoji")

			-- Clone the default Telescope configuration
			local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

			-- I want to search in hidden/dot files.
			table.insert(vimgrep_arguments, "--hidden")
			-- I don't want to search in the `.git` directory.
			table.insert(vimgrep_arguments, "--glob")
			table.insert(vimgrep_arguments, "!**/.git/*")

			telescope.setup {
				defaults = {
					-- `hidden = true` is not supported in text grep commands.
					vimgrep_arguments = vimgrep_arguments,
					path_display = {
						filename_first = {
							reverse_directories = true,
						},
					},
					dynamic_preview_title = true,
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
					lsp_references = {
						preview = false,
						layout_strategy = 'vertical',
						layout_config = { width = 0.5 },
					},
					lsp_implementations = {
						layout_strategy = 'vertical',
						layout_config = { width = 0.5 },
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_cursor {
							-- even more opts
						}

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					}
				}
			}

			telescope.load_extension("ui-select")

			-- LSP
			vim.keymap.set("n", "<C-t>", builtin.lsp_dynamic_workspace_symbols, { desc = 'LSP: Dynamic workspace symbols' })
			vim.keymap.set("n", "<leader>lsd", builtin.lsp_document_symbols, { desc = 'LSP: Document symbols' })
			vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = 'LSP: Diagnostics' })
			vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = 'LSP: Go to implementations' })
			vim.keymap.set("n", "gr", builtin.lsp_references, { desc = 'LSP: Go to references' })
		end
	}
}
