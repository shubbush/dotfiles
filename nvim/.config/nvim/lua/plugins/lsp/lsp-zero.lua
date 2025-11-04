function setupLspZero()
	local lsp_zero = require('lsp-zero')
	require('fidget').setup()
	local navic = require("nvim-navic")

	lsp_zero.on_attach(function(client, bufnr)
		-- see :help lsp-zero-keybindings
		-- to learn the available actions
		lsp_zero.default_keymaps({ buffer = bufnr })
	end)

	require('mason').setup({})
	require('mason-lspconfig').setup({
		handlers = {
			lsp_zero.default_setup,
		},
	})

	vim.lsp.config["nil_ls"] = {
		settings = {
			['nil'] = {
				formatting = {
					command = { "nixpkgs-fmt" }, },
			},
		},
	}



	-- require 'lspconfig'.gopls.setup {
	-- 	settings = {
	-- 		['gopls'] = {qq
	-- 			codelenses = {
	-- 				gc_details = false,
	-- 				generate = true,
	-- 				regenerate_cgo = true,
	-- 				run_govulncheck = true,
	-- 				test = true,
	-- 				tidy = true,
	-- 				upgrade_dependency = true,
	-- 				vendor = false,
	-- 			},
	-- 			hints = {
	-- 				assignVariableTypes = false,
	-- 				compositeLiteralFields = false,
	-- 				compositeLiteralTypes = false,
	-- 				constantValues = false,
	-- 				functionTypeParameters = false,
	-- 				parameterNames = false,
	-- 				rangeVariableTypes = false,
	-- 			},
	-- 		},
	-- 	},
	-- }

	lsp_zero.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"

		-- Register group names for which-key
		vim.keymap.set("n", "<leader>l", "<nop>", { buffer = bufnr, desc = '+lsp' })
		vim.keymap.set("n", "<leader>a", "<nop>", { buffer = bufnr, desc = '+all/diagnostics' })
		vim.keymap.set("n", "<leader>r", "<nop>", { buffer = bufnr, desc = '+rename' })

		-- LSP
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'LSP: Go to defenition' })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'LSP: Hover documentation' })

		vim.keymap.set("n", "<leader>lcl", vim.lsp.codelens.run, { desc = 'LSP: Run codelens' })
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
			{ buffer = bufnr, remap = false, desc = 'LSP: Signature help' })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'LSP: Rename symbol' })
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = 'LSP: Format buffer' })
		vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { desc = 'LSP: Code actions' })
		vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end,
			{ buffer = bufnr, remap = false, desc = 'LSP: Rename symbol' })
		vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end,
			{ buffer = bufnr, remap = false, desc = 'LSP: Workspace symbols' })

		-- Diagnostics
		-- all workspace diagnostics
		vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist, { desc = 'Diagnostics: All workspace' })

		-- all workspace errors
		vim.keymap.set("n", "<leader>ae", function()
			vim.diagnostic.setqflist({ severity = "E" })
		end, { desc = 'Diagnostics: All workspace errors' })

		-- all workspace warnings
		vim.keymap.set("n", "<leader>aw", function()
			vim.diagnostic.setqflist({ severity = "W" })
		end, { desc = 'Diagnostics: All workspace warnings' })

		-- buffer diagnostics only
		vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = 'Diagnostics: Buffer only' })

		-- current line diagnostics only
		vim.keymap.set("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>',
			{ desc = 'Diagnostics: Current line' })

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev({ wrap = false })
		end, { desc = "Diagnostics next" })

		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next({ wrap = false })
		end, { desc = "Diagnostics prev" })

		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end)
end
