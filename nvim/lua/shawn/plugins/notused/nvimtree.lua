return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function() 

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
                side = "right"
            },
            renderer = {
                group_empty = true,
            },
            -- filters = {
            --   dotfiles = true,
            -- },
        })

        -- Key maps
        vim.keymap.set('n', '<leader>e', ":NvimTreeFindFile<CR>")
        vim.keymap.set('n', '<leader>E', ":NvimTreeToggle<CR>")
    end,
}
