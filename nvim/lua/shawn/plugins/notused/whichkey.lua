return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})


		local wk = require("which-key")
        wk.add(
		{
			{ "<leader>M", group = "Modes" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>n", group = "No Highlight" },
			{ "<leader>p", group = "Project" },
			{ "<leader>t", group = "CP Testing" },
		})
	end,
}
