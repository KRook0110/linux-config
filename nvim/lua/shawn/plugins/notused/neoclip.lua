return {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    dependencies = {
        {'kkharji/sqlite.lua', module = 'sqlite'},
        -- you'll need at least one of these
        -- {'nvim-telescope/telescope.nvim'},
        -- {'ibhagwan/fzf-lua'},
    },
    config = function()
        require('neoclip').setup({
            history = 100,
            enable_persistent_history = true,
            continuous_sync = true,
        })
        require('telescope').load_extension('neoclip')
        -- vim.keymap.set("n", "<leader>fv", function() require('telescope').extensions.neoclip.default() end , { desc = "find clipboard" })
        vim.keymap.set("n", "<leader>fc","<CMD>Telescope neoclip<CR>", { desc = "find clipboard" })
    end,
}

