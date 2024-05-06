return{
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		-- Show Mode on Status line
		require("lualine").setup({
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					}
				},
			},
		})

		-- -- Show mode on notification
		-- local noice = require("noice")
		-- noice.setup({
		-- 	routes = {
		-- 		{
		-- 			view = "notify",
		-- 			filter = { event = "msg_showmode" },
		-- 		},
		-- 	},
		-- })
	end,


}

