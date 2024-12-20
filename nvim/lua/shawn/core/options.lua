-- -- [[ Opitons.lua ]]

local opt = vim.opt
opt.termguicolors = true

-- line numbers
opt.nu = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showtabline = 1 -- shows the tab lines -- the top part of the buffer
opt.cursorline = true

-- netrw
vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
vim.g.netrw_banner = 0;

-- tabstop
opt.tabstop = 4 -- insert 4 spaces for tab
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true   -- true: use spaces, false: use tabs
opt.smartindent = true -- no idea
opt.joinspaces = false

-- code wrap
opt.wrap = true
opt.linebreak = true
opt.foldmethod = "marker"
opt.foldlevel = 10
opt.modelines = 1

-- undo file backup
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("config") .. "/.undo"
opt.undofile = true

-- no highlight searh
opt.hlsearch = true
opt.incsearch = true

-- window view options
opt.scrolloff = 0
opt.isfname:append("@-@")
opt.equalalways = true -- I don't like my windows changing all the time
opt.splitright = true  -- Prefer windows splitting to the right
opt.splitbelow = true  -- Prefer windows splitting to the bottom
opt.updatetime = 1000
opt.conceallevel = 0   -- :h conceallevel

-- opt.colorcolumn = "80"

--Mouse
opt.mouse = "a" -- enables mouse

-- Searches
opt.ignorecase = true
opt.smartcase = true

-- Split Bars
-- vim.cmd([[set fillchars+=vert:\ ]])

-- Spelling
-- opt.spell = true
opt.spellsuggest = "double"
opt.spelllang = "en,id"

-- line wrap breaks
opt.showbreak = "↪ "
-- opt.listchars = {extends = "→"}
-- opt.list = true

-- syntax highlight
vim.g.syntax = "on"

-- Random
-- opt.clipboard = "unnamedplus" -- allows neovim to access system clipboard
opt.cmdheight = 1    -- height of neovim command line
opt.showmode = false -- removes -- INSERT --
opt.path:append("**")
opt.wildmenu = true

-- wildmenu ignore
opt.wildignore:append({
    "*/node_modules/*",
    ".git",
    ".git/*",
})

-- remove statusline
-- opt.laststatus = 0

-- Completion max height
opt.pumheight = 15;

-- autosave
vim.opt.autowrite = true;
vim.opt.autowriteall = true;
