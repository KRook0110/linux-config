-- removes trailing spaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos(".", save_cursor)
    end,
})

-- disables auto indent on comment line
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- Last recent cursor line position
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Cursorline highlighting control
--  Only have it on in the active buffer
-- vim.opt.cursorline = true -- Highlight the current line
-- local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
-- local set_cursorline = function(event, value, pattern)
--     vim.api.nvim_create_autocmd(event, {
--         group = group,
--         pattern = pattern,
--         callback = function()
--             vim.opt_local.cursorline = value
--         end,
--     })
-- end
-- set_cursorline("WinLeave", false)
-- set_cursorline("WinEnter", true)
-- set_cursorline("FileType", false, "TelescopePrompt")


-- remove terminal line numbers

vim.api.nvim_create_autocmd("TermOpen", {

    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        -- vim.cmd('startinsert')
    end,
})

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost",
    {
        callback = function()
            vim.highlight.on_yank({ hlgroup = "IncSearch", timeout = 300 })
        end
    }
)


-- When in json use spaces
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    {
        pattern = { "*.json" },
        callback = function()
            vim.opt_local.expandtab = true
        end
    }
)


-- quickfix list
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = { "qf" },
        callback = function()
            local buf = vim.api.nvim_get_current_buf()
            local opt = { buffer = buf, noremap = true, silent = true }
            vim.keymap.set("n", "j", "j<CR>zz<C-w>p", opt);
            vim.keymap.set("n", "k", "k<CR>zz<C-w>p", opt);
        end,
    }
)

-- netrw line number
-- autocmd FileType netrw setlocal number
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = { "netrw" },
        callback = function()
            vim.opt_local.nu = true;
        end,
    }
)

-- Makeprg
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = { "cpp" },
        callback = function()
            vim.opt_local.makeprg = [[g++ %:p -o %:r -O2 -Wall -Wshadow -fsanitize=address,undefined -fno-omit-frame-pointer -g ]]
        end,
    }
)


-- if markdown
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = {
            "markdown"
        },
        callback = function()
            vim.opt_local.spell = true;
        end,
    }
)

