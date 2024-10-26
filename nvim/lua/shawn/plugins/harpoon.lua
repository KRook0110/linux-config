return {
    "ThePrimeagen/harpoon",
    lazy=false,
    -- event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require("harpoon").setup({
            tabline = true,
            menu = {
                  width = vim.api.nvim_win_get_width(0) - 100,
            },
            global_settings = {
                -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
                save_on_toggle = true,

                -- saves the harpoon file upon every change. disabling is unrecommended.
                save_on_change = true,

                -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
                enter_on_sendcmd = false,

                -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
                tmux_autoclose_windows = false,

                -- filetypes that you want to prevent from adding to the harpoon list menu.
                excluded_filetypes = { "harpoon" },

                -- set marks specific to each git branch inside git repository
                mark_branch = false,

                -- enable tabline with harpoon marks
                tabline = true,
                tabline_prefix = "   ",
                tabline_suffix = "   ",

                menu = {
                    width = vim.api.nvim_win_get_width(0) - 10,
                }
            }
        })

        vim.cmd("highlight! HarpoonInactive guibg=NONE")
        vim.cmd("highlight! HarpoonActive guibg=#7aa2f7 guifg=black")
        vim.cmd("highlight! HarpoonNumberActive guibg=#7aa2f7 guifg=black")
        vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
        vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")


        local opts = {silent=true, noremap=true}
        vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, { desc = "harpoon add file" } )
        vim.keymap.set("n", "<leader>r", function() require("harpoon.mark").rm_file() end, { desc = "harpoon remove file" } )
        vim.keymap.set("n", "<leader>hc", function() require('harpoon.mark').clear_all() end, {desc = "harppon clear all"} )
        vim.keymap.set("n", "<leader>hu", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "harpoon ui" } )
        vim.keymap.set("n", "]h", function() require("harpoon.ui").nav_next() end, { desc = "harpoon next" } )
        vim.keymap.set("n", "[h", function() require("harpoon.ui").nav_prev() end, { desc = "harpoon prev" } )

        vim.keymap.set("n", "<leader>1", function() require('harpoon.ui').nav_file(1) end , opts)
        vim.keymap.set("n", "<leader>2", function() require('harpoon.ui').nav_file(2) end , opts)
        vim.keymap.set("n", "<leader>3", function() require('harpoon.ui').nav_file(3) end , opts)
        vim.keymap.set("n", "<leader>4", function() require('harpoon.ui').nav_file(4) end , opts)
        vim.keymap.set("n", "<leader>5", function() require('harpoon.ui').nav_file(5) end , opts)
        vim.keymap.set("n", "<leader>6", function() require('harpoon.ui').nav_file(6) end , opts)
    end,

}
