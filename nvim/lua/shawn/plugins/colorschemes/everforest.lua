return {
	"sainnhe/everforest",
	config = function()
		-- let g:everforest_background = 'soft' | 'medium' | 'hard'
		-- let g:everforest_ui_contrast = 'high' | 'low'

		vim.cmd [[
			let g:everforest_background = 'medium'
			let g:everforest_ui_contrast = 'low'

			" For better performance
			let g:everforest_better_performance = 1

		]]
	end
}
