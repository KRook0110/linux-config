return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				-- javascript = { { "prettierd", "prettier" } },
				-- cpp = {"clang-format"},

				python = { "autopep8" },
				cpp = { "clang-format" },
				c = { "clang-format" },

				css = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },

				go = { "gofmt" },

                ["*"] = { "codespell" },
			},
			-- format_on_save = {
			-- 	timeout = 500,
			-- 	lsp_fallback = true,
			-- },
		})

		-- Configs
		local cf = require("conform").formatters

		vim.keymap.set("n", "<leader>pf", function()
			require("conform").format({
				-- "always" -> always use vim.lsp.buf.format()
				-- true -> if formatters aren't available then use vim.lsp.buf.format()
				-- false -> never use lsp formatting
				lsp_fallback = true,
			})
			-- vim.lsp.buf.format()
		end, { desc = "format" })
	end,
}
