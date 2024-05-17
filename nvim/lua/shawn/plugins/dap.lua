return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},
	config = function()
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({})

		require("dap-go").setup()

		-- dapui listeners
		local dap, dapui = require("dap"), require("dapui")
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

		-- custom highlights
		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

		-- keymaps

		vim.keymap.set("n", "<leader>du", function()
			dapui.toggle()
		end, { desc = "Toggle UI" })

		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "Break Point" })

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, { desc = "Continue" })

		vim.keymap.set("n", "<leader>dl", function()
			dap.run_last()
		end, { desc = "Run Last" })

		vim.keymap.set("n", "<leader>dO", function()
			dap.step_over()
		end, { desc = "Step Over" })

		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, { desc = "Step Into" })

		vim.keymap.set("n", "<leader>do", function()
			require("dap").step_out()
		end, {desc = "Step Out"})

		-- dap server configs

        -- C++
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }
        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp


	end,
}
