return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                              , branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            "nvim-telescope/telescope-file-browser.nvim",


			-- has no meaning
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information

            -- "nvim-telescope/telescope-ui-select.nvim"
        },
        config = function()

            local actions = require("telescope.actions")
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                    },
                    theme = "center",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.3,
                        },
                    },
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                        },
                        n = {
                            ["q"] = actions.close,
                        }
                    },
                },
            }
            -- require("telescope").load_extension("ui-select")

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', function() builtin.find_files({previewer = false}) end, {desc = "files"})
            vim.keymap.set('n', '<leader>S', builtin.current_buffer_fuzzy_find, {desc = "current buffer"})
            vim.keymap.set('n', '<leader>A', builtin.live_grep, {desc = "All"})
            vim.keymap.set('n', '<leader>FC', builtin.colorscheme, {desc = "Colorscheme"})
            vim.keymap.set('n', '<leader>Fc', builtin.registers, {desc= "Clipboard"})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {desc = "Buffers"})
            vim.keymap.set('n', '<leader>o', builtin.treesitter, {desc = "Treesitter", silent=true, noremap = true})
            vim.keymap.set('n', '<leader>m', builtin.marks, {desc = "Marks", silent=true, noremap = true})
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function ()
            -- You dont need to set any of these options. These are the default ones. Only
            -- the loading is important
            require('telescope').setup {
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require('telescope').load_extension('fzf')
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        event="VeryLazy",
        config= function ()
            -- You don't need to set any of these options.
            -- IMPORTANT!: this is only a showcase of how you can set default options!
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        -- theme = "ivy",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                            },
                        },
                    },
                },
            }
            -- To get telescope-file-browser loaded and working with telescope,
            -- you need to call load_extension, somewhere after setup function:
            require("telescope").load_extension "file_browser"


            vim.keymap.set("n", "<leader>e", function()
                require("telescope").extensions.file_browser.file_browser({
                    files=false,
                    git_status=false,
					grouped=true,
                })
            end, {desc="File Browser"})


			vim.keymap.set("n", "<leader>E", function()
				require("telescope").extensions.file_browser.file_browser({
					git_status=false,
					path="%:p:h",
					select_buffer=true,
				})
			end, {desc="Workspace File Browser"})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function ()
			-- This is your opts table
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
							-- even more opts
						},
						codeactions = true

					}
				}
			}
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end
	}

}
