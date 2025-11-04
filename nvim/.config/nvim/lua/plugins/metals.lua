-- Metals
return {
	{
		'scalameta/nvim-metals',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
			"hrsh7th/cmp-nvim-lsp",
		},
		enabled = false,
		config = function()
			local api = vim.api

			-- LSP mappings
			--vim.keymap.set("n", "<leader>ws", function()
			--  require("metals").hover_worksheet()
			--end)

			----------------------------------
			-- LSP Setup ---------------------
			----------------------------------
			local metals_config = require("metals").bare_config()

			-- Example of settings
			metals_config.settings = {
				showImplicitArguments = false,
				verboseCompilation = true,
			}
			metals_config.init_options.statusBarProvider = "off"
			metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()


			metals_config.on_attach = function(client, bufnr)
				require("metals").setup_dap()
			end

			-- Autocmd that will actually be in charging of starting the whole thing
			local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
			api.nvim_create_autocmd("FileType", {
				-- NOTE: You may or may not want java included here. You will need it if you
				-- want basic Java support but it may also conflict if you are using
				-- something like nvim-jdtls which also works on a java filetype autocmd.
				pattern = { "scala", "sbt", "java" },
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})


			-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
			metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
		end
	}
}
