return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",

			-- has no meaning
			-- "https://github.com/echasnovski/mini.icons",
			-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			-- "MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information

			-- "nvim-telescope/telescope-ui-select.nvim"
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<CR>"] = function(bufnr)
								actions.select_default(bufnr)
								actions.center(bufnr)
							end,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<esc>"] = actions.close,
						},
						n = {
							["<CR>"] = function(bufnr)
								actions.select_default(bufnr)
								actions.center(bufnr)
							end,

							["l"] = actions.cycle_history_next,
							["h"] = actions.cycle_history_prev,
							["q"] = actions.close,

							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<esc>"] = actions.close,
						},
					},
					wrap_results = true,
					file_ignore_patterns = {
						"node_modules",
						"node_modules/",
						".git/",
					},
					-- theme = "center",
					-- sorting_strategy = "ascending",
					-- layout_config = {
					-- 	horizontal = {
					-- 		prompt_position = "top",
					-- 		preview_width = 0.3,
					-- 	},
					-- },
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fa", builtin.current_buffer_fuzzy_find, { desc = "current buffer" })
			vim.keymap.set("n", "<leader>fC", builtin.colorscheme, { desc = "Colorscheme" })
			vim.keymap.set("n", "<leader>fc", builtin.registers, { desc = "Clipboard" })
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ previewer = false, hidden = true })
			end, { desc = "files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "Treesitter", silent = true, noremap = true })
			vim.keymap.set(
				"n",
				"<leader>fO",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "Lsp Workspace Symbols", silent = true, noremap = true }
			)
			vim.keymap.set("n", "<leader>fd", ":Telescope fd find_command=fd,-t=d<CR>", { desc = "Directories" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		build = "make",
		config = function()
			-- You dont need to set any of these options. These are the default ones. Only
			-- the loading is important
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		-- You don't need to set any of these options.
	-- 		-- IMPORTANT!: this is only a showcase of how you can set default options!
	-- 		local actions = require("telescope.actions")
	-- 		require("telescope").setup({
	-- 			extensions = {
	-- 				file_browser = {
	-- 					-- theme = "ivy",
	-- 					-- disables netrw and use telescope-file-browser in its place
	-- 					hijack_netrw = true,
	-- 					grouped = true,
	-- 					-- initial_mode = "normal",
	-- 				},
	-- 			},
	-- 		})
	-- 		-- To get telescope-file-browser loaded and working with telescope,
	-- 		-- you need to call load_extension, somewhere after setup function:
	-- 		require("telescope").load_extension("file_browser")
	--
	-- 		vim.keymap.set("n", "<leader>E", function()
	-- 			require("telescope").extensions.file_browser.file_browser({
	-- 				files = false,
	-- 				git_status = false,
	-- 				grouped = true,
	-- 			})
	-- 		end, { desc = "File Browser" })
	--
	-- 		vim.keymap.set("n", "<leader>e", function()
	-- 			require("telescope").extensions.file_browser.file_browser({
	--                    hidden=true,
	-- 				grouped = true,
	-- 				git_status = false,
	-- 				path = "%:p:h",
	-- 				select_buffer = true,
	-- 				-- initial_mode = "insert"
	-- 			})
	-- 		end, { desc = "Workspace File Browser" })
	-- 	end,
	-- },
	-- {
	-- 	"nvim-telescope/telescope-ui-select.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		-- This is your opts table
	-- 		require("telescope").setup({
	-- 			extensions = {
	-- 				["ui-select"] = {
	-- 					require("telescope.themes").get_dropdown({
	-- 						-- even more opts
	-- 					}),
	-- 					codeactions = true,
	-- 				},
	-- 			},
	-- 		})
	-- 		-- To get ui-select loaded and working with telescope, you need to call
	-- 		-- load_extension, somewhere after setup function:
	-- 		require("telescope").load_extension("ui-select")
	-- 	end,
	-- },
}
