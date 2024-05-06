return {
    "mbbill/undotree",
    config = function ()
        vim.keymap.set("n", "<leader>pu","<CMD>UndotreeToggle<CR>", {desc="Undo Tree"})
    end,
}
