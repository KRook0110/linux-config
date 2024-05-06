return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				cpp = {"clang-format"},
			},
		})

		-- Configs
		local cf = require("conform").formatters


		vim.keymap.set("n", "<leader>pf", function()
			require("conform").format()
		end, { desc = "format current file" })
	end,
}
