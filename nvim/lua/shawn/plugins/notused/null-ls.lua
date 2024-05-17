return {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies  = {'jay-babu/mason-null-ls.nvim'},
    event="VeryLazy",
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = { "stylua", "jq" },
            automatic_installation = true,
        })
        require("null-ls").setup()

        vim.keymap.set("n", "<leader>pf", function() vim.lsp.buf.format() end, { desc = "format" }) -- Formating

    end,
}
