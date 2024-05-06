return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
        "nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-telescope/telescope-dap.nvim"
	},
	config = function()
		require('dapui').setup()
		require('dap-go').setup()
		require("mason-nvim-dap").setup({
			ensure_installed = {"python", "cppdbg"},
			automatic_installation = true,
		})
		-- dapui listeners
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- keymaps
		vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, {desc = "Toggle UI"})
		vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, {desc = "Break Point"})
		vim.keymap.set("n", "<leader>dc", function() dap.continue() end, {desc = "Continue"})
		vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, {desc = "Run Last"})
		vim.keymap.set("n", "<leader>do", function() dap.step_over() end, {desc = "Step Over"})
		vim.keymap.set("n", "<leader>di", function() dap.step_into() end, {desc = "Step Into"})

		-- dap server configs
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" }
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch", program = function()
					local temp = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					return temp
				end,
				cwd = "${workspaceFolder}",
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
