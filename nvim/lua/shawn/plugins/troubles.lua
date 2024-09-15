return {
	"folke/trouble.nvim",
	branch = "main", -- IMPORTANT!
	keys = {
		{
			"<leader>pP",
			"<cmd>Trouble diagnostics toggle focut=true<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>pp",
			"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>ps",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
		-- {
		-- 	"<leader>pl",
		-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		-- 	desc = "LSP Definitions / references / ... (Trouble)",
		-- },
	},
	opts = {}, -- for default options, refer to the configuration section for custom setup.
}
