require("shawn.core")
require("shawn.lazy")


-- vim.cmd.colorscheme "catppuccin-macchiato"
vim.cmd.colorscheme "tokyonight-night"
-- vim.cmd.colorscheme "everforest"
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "monokai-pro-default"
-- vim.cmd.colorscheme "gruvbox-material"

-- Colors

-- Pink-900 : #51B3EC
-- Pink-700 : #FDA8C7
-- Pink-500 : #EFC4D4

-- Cyan-900 : #51B3EC
-- Cyan-700 : #A8D9F6
-- Cyan-500 : #C4DDEB

-- White : white
-- White-700 : #51B3EC
-- White-500 : #c2c2c2

vim.api.nvim_exec_autocmds("FileType", {})
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#A8D9F6', bold=true }) -- cyan
vim.api.nvim_set_hl(0, 'LineNr', { fg='#c2c2c2', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FDA8C7', bold=true }) -- pink

-- vim.api.nvim_set_hl(0, 'LineNrAbove', { bold=true, italic=true }) -- cyan
-- vim.api.nvim_set_hl(0, 'LineNr', {bold=true })
-- vim.api.nvim_set_hl(0, 'LineNrBelow', {bold=true , italic=true}) -- pink

vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
