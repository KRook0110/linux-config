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
			vim.g.gruvbox_material_transparent_background = 2
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_background = "soft"
			vim.g.gruvbox_material_better_performance = 1;

			-- vim.cmd([[
			--              let g:gruvbox_material_colors_override = {
			--                  \ 'aqua':             ['#a9b665',   '142'],
			--                  \ 'blue':             ['#ddc7a1',   '223'],
			--                  \ 'green':            ['#ddc7a1',   '223'],
			--              \ }
			--              ]])

			-- \ 'fg0':              ['#d4be98',   '223'],
			-- \ 'fg1':              ['#ddc7a1',   '223'],
			-- \ 'red':              ['#ea6962',   '167'],
			-- \ 'orange':           ['#e78a4e',   '208'],
			-- \ 'yellow':           ['#d8a657',   '214'],
			-- \ 'green':            ['#a9b665',   '142'],
			-- \ 'aqua':             ['#89b482',   '108'],
			-- \ 'blue':             ['#7daea3',   '109'],
			-- \ 'purple':           ['#d3869b',   '175'],
			-- \ 'bg_red':           ['#ea6962',   '167'],
			-- \ 'bg_green':         ['#a9b665',   '142'],
			-- \ 'bg_yellow':        ['#d8a657',   '214']
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
