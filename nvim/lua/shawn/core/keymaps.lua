-- [[ Keymaps.lua ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- line navigation
map("n", "J", "mzJ'z", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
-- map("n", "<C-d>", "M<C-d>zz", opts)
-- map("n", "<C-u>", "M<C-u>zz", opts)
map("n", "<leader>n", ":noh<CR>", opts)
map("n", "]q", "<CMD>cn<CR>", { desc = "next quickfix list" })
map("n", "[q", "<CMD>cp<CR>", { desc = "prev quickfix list" })
map("n", "<M-j>", "<CMD>cn<CR>", { desc = "next quickfix list" })
map("n", "<M-k>", "<CMD>cp<CR>", { desc = "prev quickfix list" })
-- map("n", "[b", "<CMD>bprev<CR>", { desc = "prev buffer" })
-- map("n", "]b", "<CMD>bnext<CR>", { desc = "next buffer" })

-- for wraps
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- code manipulation

local exchange_state = false
map("n", "cx", function()
	if exchange_state then
		vim.cmd('normal! mZ"zdiw')
		vim.cmd([[normal! `Z"yP`Y"zP]])
	else
		vim.cmd('normal! mY"ydiw')
	end
	exchange_state = not exchange_state
end) -- set words that you want to exchange
map("n", "cX",function() exchange_state = false; end)

-- window
map({ "n", "i" }, "<C-j>", ":wincmd j<CR>", opts)
map({ "n", "i" }, "<C-k>", ":wincmd k<CR>", opts)
map({ "n", "i" }, "<C-l>", ":wincmd l<CR>", opts)
map({ "n", "i" }, "<C-h>", ":wincmd h<CR>", opts)

-- window resize
map("n", "<Up>", ":res +1<CR>", opts)
map("n", "<Down>", ":res -1<CR>", opts)
map("n", "<Left>", ":vertical res +1<CR>", opts)
map("n", "<Right>", ":vertical res -1<CR>", opts)

-- terminal window manager
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Normal Mode", silent = true })
map({ "t" }, "<C-j>", "<C-\\><C-n>:wincmd j<CR>", opts)
map({ "t" }, "<C-k>", "<C-\\><C-n>:wincmd k<CR>", opts)
map({ "t" }, "<C-l>", "<C-\\><C-n>:wincmd l<CR>", opts)
map({ "t" }, "<C-h>", "<C-\\><C-n>:wincmd h<CR>", opts)

-- copy and paste
map("n", "<leader>Y", '"+Y', { desc = "Copy to Clipboard" })
map("v", "<leader>Y", '"+ygv', { desc = "Copy to Clipboard" })
map("n", "<leader>P", '"+p', { desc = "Paste to Clipboard" })
map("v", "<leader>P", '"_d"+p', { desc = "Paste to Clipboard" })

-- Insert shortcuts
-- map("i", "<C-CR>", "<ESC>o")
map("i", "jk", "<Esc>", opts)
-- map("i", "{<CR>", "{<CR>}<Esc>O", opts);

-- Change Modes

-- Explorer Netrw
-- if using oil comment
-- map("n", "<leader>e", ":Ex<CR>")

-- get current buffer path
-- map("n", "<leader>bp", "<CMD>let @+ = expand('%:p')<CR>")
-- map("n", "<leader>bb", "<CMD>b#<CR>", { desc = "Alternative buffer" })
--
-- map("n", "<leader>bt", function()
-- 	local indent_size = vim.fn.input("New Tab Size : ")
-- 	vim.cmd("setlocal autoindent expandtab tabstop=" .. indent_size .. " shiftwidth=" .. indent_size)
-- end)
