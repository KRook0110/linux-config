return {
	"hrsh7th/nvim-cmp", -- CMP
	dependencies = {
		"hrsh7th/cmp-buffer", -- text in current buffer
		"hrsh7th/cmp-path", -- path in file systems
		"hrsh7th/cmp-cmdline", -- path in file systems
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- auto completion
		"rafamadriz/friendly-snippets", -- useful snippets
		"f3fora/cmp-spell", -- spelling
		"uga-rosa/cmp-dictionary", -- spelling
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- load snippets from path/of/your/nvim/config/my-cool-snippets
		require("luasnip.loaders.from_vscode").load({ paths = vim.fn.stdpath("config") .. "/snippets/" })

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		cmp.setup({ -- CMP
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				-- `Enter` key to confirm completion
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- -- Ctrl+x to trigger completion menu | Ctrl + space Broken cuz i use tmux
				["<C-space>"] = cmp.mapping.complete(),
				-- ['<C-space>'] = cmp.mapping.confirm({ select = true }),

				-- Navigate between snippet placeholder
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- Scroll up and down in the completion documentation
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- ['<C-CR>'] = cmp.mapping.complete()
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- current buffer
				{ name = "path" }, -- file system paths
				-- { name = "dictionary", keyword_length = 2 }, -- spelling
				{
					name = "spell",
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return true
						end,
						--     enable_in_context = function()
						--         return require('cmp.config.context').in_treesitter_capture('spell')
						-- end,
					},
				},
			}),
		})

		-- require("cmp_dictionary").setup({
		--     paths = { "/usr/share/dict/words" },
		--     exact_length = 3,
		--     first_case_insensitive = true,
		--     document = {
		--         enable = true,
		--         command = { "wn", "${label}", "-over" },
		--     },
		-- })
	end,
}
