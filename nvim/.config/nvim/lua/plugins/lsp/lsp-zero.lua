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

	require 'lspconfig'.nil_ls.setup {
		settings = {
			['nil'] = {
				formatting = {
					command = { "nixpkgs-fmt" },
				},
			},
		},
	}

	require 'lspconfig'.gopls.setup {
		settings = {
			['gopls'] = {
				codelenses = {
					gc_details = false,
					generate = true,
					regenerate_cgo = true,
					run_govulncheck = true,
					test = true,
					tidy = true,
					upgrade_dependency = true,
					vendor = false,
				},
				hints = {
					assignVariableTypes = false,
					compositeLiteralFields = false,
					compositeLiteralTypes = false,
					constantValues = false,
					functionTypeParameters = false,
					parameterNames = false,
					rangeVariableTypes = false,
				},
			},
		},
	}

	lsp_zero.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }
		-- LSP
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'LSP: Go to defenition' })
		vim.keymap.set("n", "K", vim.lsp.buf.hover)

		vim.keymap.set("n", "<leader>lcl", vim.lsp.codelens.run)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
		vim.keymap.set("n", "g.", vim.lsp.buf.code_action)
		vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)

		-- Diagnostics
		-- all workspace diagnostics
		vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

		-- all workspace errors
		vim.keymap.set("n", "<leader>ae", function()
			vim.diagnostic.setqflist({ severity = "E" })
		end)

		-- all workspace warnings
		vim.keymap.set("n", "<leader>aw", function()
			vim.diagnostic.setqflist({ severity = "W" })
		end)

		-- buffer diagnostics only
		vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

		-- current line diagnostics only
		vim.keymap.set("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>')

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev({ wrap = false })
		end)

		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next({ wrap = false })
		end)

		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end)
end
