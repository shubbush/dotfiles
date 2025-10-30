return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			-- Register group name for which-key
			vim.keymap.set("n", "<leader>d", "<nop>", { desc = '+debug/delete' })

			vim.keymap.set("n", "<leader>dc", function()
				require("dap").continue()
			end, { desc = 'Debug: Continue' })

			vim.keymap.set("n", "<leader>dr", function()
				require("dap").repl.toggle()
			end, { desc = 'Debug: Toggle REPL' })

			vim.keymap.set("n", "<leader>dK", function()
				require("dap.ui.widgets").hover()
			end, { desc = 'Debug: Hover' })

			vim.keymap.set("n", "<leader>dt", function()
				require("dap").toggle_breakpoint()
			end, { desc = 'Debug: Toggle breakpoint' })

			vim.keymap.set("n", "<leader>dso", function()
				require("dap").step_over()
			end, { desc = 'Debug: Step over' })

			vim.keymap.set("n", "<leader>dsi", function()
				require("dap").step_into()
			end, { desc = 'Debug: Step into' })

			vim.keymap.set("n", "<leader>dl", function()
				require("dap").run_last()
			end, { desc = 'Debug: Run last' })

			-- Debug settings if you're using nvim-dap
			local dap = require("dap")

			dap.configurations.scala = {
				{
					type = "scala",
					request = "launch",
					name = "RunOrTest",
					metals = {
						runType = "runOrTestFile",
						--args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
					},
				},
				{
					type = "scala",
					request = "launch",
					name = "Test Target",
					metals = {
						runType = "testTarget",
					},
				},
			}
		end
	}
}
