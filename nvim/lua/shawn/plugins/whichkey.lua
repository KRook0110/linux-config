return {
    "folke/which-key.nvim",
    event="VeryLazy",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        })

        local wk = require("which-key")

        wk.register({
            M = {name = "Modes"},
            p = {
                name = "Project",
            },
            d = { name = "Debug" },
            n = { name = "No Highlight" },
            s = { name = "Split", h = "Horizontal", v = "Vertical" },
            h = { name = "Harpoon" },
            g = {
                name = "Git",
                t = "Toggle"
            },
            t = { name = "CP Testing" }
        }, { prefix = "<leader>" })
    end,
}
