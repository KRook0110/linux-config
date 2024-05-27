return {
    "navarasu/onedark.nvim",
    config = function()
        -- Lua
        require('onedark').setup {
            -- style = 'darker'
        }
        require('onedark').load()
    end,
}
