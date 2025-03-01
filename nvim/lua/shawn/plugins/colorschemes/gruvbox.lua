return {
	{
		"luisiacc/gruvbox-baby",
		config = function()
			vim.g.gruvbox_baby_transparent_mode = 1
			vim.g.gruvbox_baby_telescope_theme = 1
		end,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			-- vim.g.gruvbox_material_background = 'hard' | 'medium' | 'soft'
			-- vim.g.gruvbox_material_foreground = 'mix' | 'material' | 'original'
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_foreground = "original"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_enable_bold = 0
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_disable_italic_comment = 1

		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				transparent_mode = false,
				-- formatting
				bold = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = false,
				contrast = "hard",
				overrides = {},
			})
		end,
	},
}
