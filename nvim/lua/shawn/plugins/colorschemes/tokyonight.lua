return  {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup{
            on_highlights = function(hl, c)
                hl.LineNr = {
                    fg="#7e82a3"
                }
            end,
        }
    end
}
