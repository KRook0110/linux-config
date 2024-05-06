return {
	{
		"ellisonleao/gruvbox.nvim"
	},
	{
		"luisiacc/gruvbox-baby"
	},
	{
		"sainnhe/gruvbox-material",
		config = function ()
			-- let g:gruvbox_material_background = 'hard' | 'medium' | 'soft'
			-- let g:gruvbox_material_foreground = 'mix' | 'material' | 'original'
			vim.cmd[[
				let g:gruvbox_material_foreground = 'material'
				let g:gruvbox_material_background = 'soft'
				let g:gruvbox_material_better_performance = 1
			]]
		end
	}
}
