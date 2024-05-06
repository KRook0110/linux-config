return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
        options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
        pre_save = nil,                                         -- a function to call before saving the session
        save_empty = false,                                     -- don't save if there are no open file buffers
    },
    init = function()
        -- Auto turn on when entering vim
        -- vim.api.nvim_create_autocmd("VimEnter", {
            -- 	group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
            -- 	callback = function()
                -- 		if vim.fn.getcwd() ~= vim.env.HOME then
                -- 			require("persistence").load({last = true})
                -- 		end
                -- 	end,
                -- 	nested = true,
                -- })

                -- restore the session for the current directory
                vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {desc = "current directory"})

                -- restore the last session
                vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {desc = "last session"})

                -- stop Persistence => session won't be saved on exit
                vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {desc = "don't save"})
            end,
        }
