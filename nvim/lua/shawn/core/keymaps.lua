-- [[ Keymaps.lua ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

--project
-- map("n", "<leader>pv", vim.cmd.Ex) map("n", "<leader>ps", "<cmd>SymbolsOutline<CR>", {desc = "Symbols"})
-- map("n", "<leader>pe", function() vim.cmd(":!cmd.exe /C explorer.exe /select," .. vim.fn.expand("%:p")) end, {desc = "explorer"})
-- for unix
-- map("n", "<leader>pe", function() vim.cmd(":!cmd.exe /C explorer.exe \"$dir\"" .. vim.fn.expand("%:p")) end, {desc = "explorer"})
-- map("n", "<leader>pe", function() vim.cmd(":!cmd.exe /C explorer.exe " .. vim.fn.expand("%:p")) end, {desc = "explorer"})

-- redirect
-- map("n", "<leader>Rc", ":edit $MYVIMRC<CR>", {desc = "config"})
-- Simple macros
-- map("n", "<leader>qa", ":wqa<CR>")
-- map("n", "<leader>qq", ":q<CR>")
-- map("n", "<leader>w", ":wa<CR>")
-- map("n", "<Esc>", ":noh<CR>", opts)
map("n", "\\", "<Esc>", opts)

-- line navigation
map("n", "J", "mzJ'z", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "<C-d>", "M<C-d>zz", opts)
map("n", "<C-u>", "M<C-u>zz", opts)
map("n", "<leader>n", ":noh<CR>", opts)

-- for wraps
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- code manipulation

local exchange_state = false;
map("n", "cx", function()
    if exchange_state then
        vim.cmd("normal! mZ\"zdiw")
    else
        vim.cmd("normal! mY\"ydiw")
    end
    exchange_state = not exchange_state
end) -- set words that you want to exchange
map("n", "cX", "`Z\"yP`Y\"zP")

map("n", "<A-k>", ":m-2<CR>V=", opts)
map("n", "<A-j>", ":m+1<CR>V=", opts)
map("n", "<A-l>", ">>", opts)
map("n", "<A-h>", "<<", opts)
map(
	{ "n", "v" },
	"gC",
	[[ <CMD>s/\v(\w)(\w*)/\u\1\L\2/g<CR><CMD>noh<CR> ]],
	{ desc = "Capitalize Every Word", noremap = true, silent = true }
)
map("v", "<A-l>", ">gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-h>", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Paste Without Copying
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- window
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)
map("n", "<C-h>", ":wincmd h<CR>", opts)

-- window resize
map("n", "<Up>", ":res +1<CR>", opts)
map("n", "<Down>", ":res -1<CR>", opts)
map("n", "<Left>", ":vertical res +1<CR>", opts)
map("n", "<Right>", ":vertical res -1<CR>", opts)

-- terminal window manager
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Normal Mode", silent = true })

-- copy and paste
map("n", "<leader>Y", '"+Y', { desc = "Copy to Clipboard" })
map("v", "<leader>Y", '"+ygv', { desc = "Copy to Clipboard" })
map("n", "<leader>P", '"+p', { desc = "Paste to Clipboard" })
map("v", "<leader>P", '"_d"+p', { desc = "Paste to Clipboard" })

-- Insert shortcuts
map("i", "<C-CR>", "<ESC>o")
map("i", "jk", "<Esc>", opts)

-- Change Modes

local wrap_setting_state = false
map("n", "<leader>Nw", function()
	vim.opt.wrap = wrap_setting_state
	vim.opt.linebreak = wrap_setting_state
	print("Wrap is now ", wrap_setting_state)
	wrap_setting_state = not wrap_setting_state
end, { desc = "Toggle Wrap" })

local check_spelling = false
map("n", "<leader>Ns", function()
	vim.opt.spell = check_spelling
	print("Spell check is now ", check_spelling)
	check_spelling = not check_spelling
end, { desc = "Toggle Check Spell" })

local conceal_level_holder = 0
map("n", "<leader>C", function()
	vim.opt.conceallevel = conceal_level_holder
	print("Conceal Level is now ", conceal_level_holder)
	conceal_level_holder = (conceal_level_holder + 1) % 3
end, { desc = "Conceal Level" })



