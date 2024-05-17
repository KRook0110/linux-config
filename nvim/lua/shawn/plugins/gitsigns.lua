return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require('gitsigns').setup {
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            current_line_blame_formatter_opts = {
                relative_time = false,
            },
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }
        require('gitsigns').setup{
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end


                local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
                local gs = require("gitsigns")

                local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)

                -- Navigation
                map('n', ']H', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']H', bang = true})
                    else
                        -- gitsigns.nav_hunk('next')
                        next_hunk_repeat()
                    end
                end, {desc = "next git hunk"})

                map('n', '[H', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[H', bang = true})
                    else
                        -- gitsigns.nav_hunk('prev')
                        prev_hunk_repeat()
                    end
                end, { desc = "prev git hunk"})

                -- Actions
                map('n', '<leader>gs', gitsigns.stage_hunk)
                map('n', '<leader>gr', gitsigns.reset_hunk)
                map('v', '<leader>gs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                map('v', '<leader>gr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                map('n', '<leader>gS', gitsigns.stage_buffer)
                map('n', '<leader>gu', gitsigns.undo_stage_hunk)
                map('n', '<leader>gR', gitsigns.reset_buffer)
                map('n', '<leader>gp', gitsigns.preview_hunk)
                map('n', '<leader>gb', function() gitsigns.blame_line{full=true} end)
                map('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
                map('n', '<leader>gd', gitsigns.diffthis)
                map('n', '<leader>gD', function() gitsigns.diffthis('~') end)
                map('n', '<leader>gtd', gitsigns.toggle_deleted)


                -- Text object
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }



    end
}
