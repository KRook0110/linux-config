return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant="main",
            dim_inactive_windows = false,
            styles = {
                bold = false,
                italic = true,
                transparency = true,
            },
		})
	end,
}
