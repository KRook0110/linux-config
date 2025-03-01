return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
		"williamboman/mason.nvim",
	},
	config = function()
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({})
		require("dap-go").setup()

		local dap, dapui = require("dap"), require("dapui")

		-- custom highlights
		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

		-- keymaps
		vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

		-- Eval var under cursor
		vim.keymap.set("n", "<space>?", function()
			require("dapui").eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F6>", dap.restart)

		-- dap terminal

		-- dap server configs

		-- C++
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" },
            terminal = "external"
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					print("debugging : " .. path)
					return path
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
                console = "integratedTerminal"
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		-- -- dap listeners
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
