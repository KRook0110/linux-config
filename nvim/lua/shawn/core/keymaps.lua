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

-- line navigation
map("n", "J", "mzJ'z", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<leader>n", ":noh<CR>", opts)


-- for wraps
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- code manipulation
map("n", "<A-k>", ":m-2<CR>V=", opts)
map("n", "<A-j>", ":m+1<CR>V=", opts)
map("n", "<A-l>", ">>", opts)
map("n", "<A-h>", "<<", opts)
map("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", opts) -- Adds new line
map("n", "gC", [[ <CMD>s/\v<(.)(\w*)/\u\1\L\2/g<CR><CMD>noh<CR> ]], {desc="Capitalize Every Word", noremap=true, silent=true})

map("v", "<A-l>", ">gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-h>", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)
map("v", "gC", [[ <CMD>'<,'>s/\%V\v<(.)(\w*)([\_\-]?)/\u\1\L\2\3/g<CR><CMD>noh<CR> ]], {desc="Capitalize Every Word", noremap=true, silent=true})

-- paste Without Copying
map("v", "p", "\"_dp")
map("v", "P", "\"_dP")

-- window
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)
map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<leader>sv", ":vsplit<CR>:wincmd l<CR>", opts)
map("n", "<leader>sh", ":split<CR>:wincmd j<CR>", opts)
map("n", "<leader>so", ":only<CR>", opts)

-- window resize
map("n", "<Up>", ":res +1<CR>", opts)
map("n", "<Down>", ":res -1<CR>", opts)
map("n", "<Left>", ":vertical res +1<CR>", opts)
map("n", "<Right>", ":vertical res -1<CR>", opts)

-- terminal window manager
map("n", "<leader>stt", ":terminal<CR>i", opts)
map("n", "<leader>stv", ":vsplit<CR>:wincmd l<CR>:terminal<CR>i", opts)
map("n", "<leader>sth", ":split<CR>:wincmd j<CR>:terminal<CR>i", opts)
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Normal Mode", silent = true })

-- copy and paste
map("n", "<leader>Y", "\"+Y", { desc = "Copy to Clipboard" })
map("v", "<leader>Y", "\"+ygv", { desc = "Copy to Clipboard" })
map("n", "<leader>P", "\"+p", { desc = "Paste to Clipboard" })
map("v", "<leader>P", "\"_d\"+p", { desc = "Paste to Clipboard" })

-- Insert shortcuts
map("i", "jj", "<Esc>", opts)
map("i", "<M-BS>", "<C-o>daw", opts)
map("i", "<M-;>", "<C-o>$;", opts)
map("i", "<M-j>", "<C-o>j<C-o>A", opts)
map("i", "<M-k>", "<C-o>k<C-o>A", opts)

-- Change Modes
map("n", "<leader>Mw", function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.spell = true
end, { desc = "Writing" })

map("n", "<leader>Mc", function()
    vim.opt.spell = false
    vim.opt.wrap = false
    vim.opt.linebreak = false
end, { desc = "Coding" })

local conceal_level_holder = 0;
map("n", "<leader>C", function()
    vim.opt.conceallevel = conceal_level_holder
    print("Conceal Level is now ", conceal_level_holder)
    conceal_level_holder = (conceal_level_holder + 1) % 3
end, { desc = "Conceal Level" })
