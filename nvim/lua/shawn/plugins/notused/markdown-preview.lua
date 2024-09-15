-- install without yarn or npm
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
		local opts = {noremap = true, silent = true}
		local map = vim.keymap.set
		map("n", "<leader>pT", "<CMD>MarkdownPreviewToggle<CR>")
    end,


}
