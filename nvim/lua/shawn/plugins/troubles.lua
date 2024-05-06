return {
    "folke/trouble.nvim",
    config = function()
        vim.keymap.set("n", "<leader>pt", function() require("trouble").toggle() end, {desc = "Problem"} )
        vim.keymap.set("n", "]t",function() require("trouble").next({skip_groups = true, jump = true}) end, {desc = "Next Problem"})
        vim.keymap.set("n", "[t", function() require("trouble").previous({skip_groups = true, jump = true}) end, {desc = "Prev Problem"})
    end
}
