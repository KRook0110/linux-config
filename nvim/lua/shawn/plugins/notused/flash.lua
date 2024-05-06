return {
    "folke/flash.nvim", event = "VeryLazy",
    --- @type Flash.Config
    opts = {
        -- modes = { -- sets f to have jump labels
        -- 	char = {
            -- jump_labels = true,
            -- label = {
                -- 			exclude = "hjlkiarxdc"
                -- 		}
                -- 	},
                --
                -- },
                -- search = {
                    -- 	incremental = true,
                    -- },
                    -- label = {
                        -- 	style = "right_align",
                        -- }
                    },
                    -- stylua: ignore
                    keys = {
                        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
                        { "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },

                    },
                }

