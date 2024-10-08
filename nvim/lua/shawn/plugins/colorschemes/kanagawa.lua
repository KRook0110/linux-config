return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			-- terminalColors = true, -- define vim.g.terminal_color_{0,17}
			theme = "dragon", -- Load "wave" theme when 'background' option is not set
			-- background = { -- map the value of 'background' option to a theme
			-- 	dark = "dragon", -- try "dragon" !
			-- 	light = "lotus",
			-- },
		})
	end,
}
