return {
	"folke/trouble.nvim",
	config = function()
		vim.keymap.set("n", "<leader>pp", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "Problems" })
		vim.keymap.set("n", "<leader>pP", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "Project Problems" })

		vim.keymap.set("n", "]p", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end, { desc = "Next Problem" })
		vim.keymap.set("n", "[p", function()
			require("trouble").previous({ skip_groups = true, jump = true })
		end, { desc = "Prev Problem" })

	end,
}
