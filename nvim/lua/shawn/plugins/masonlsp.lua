return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        -- "SmiteshP/nvim-navic",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = "VeryLazy",


    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lsp_config = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        mason.setup({})
        mason_lspconfig.setup({
            ensure_installed = { "lua_ls" },
            automatic_installation = true
        })

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                -- delay update diagnostics
                update_in_insert = true,
            }
        )

        local keymap = vim.keymap
        local opts = { noremap = true, silent = true }
        -- local navic = require("nvim-navic")
        local on_attach = function(client, bufnr)

            -- if client.server_capabilities.documentSymbolProvider then
            --     navic.attach(client, bufnr)
            -- end
            --
            -- if navic.is_available() then
            --     vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
            -- end

            opts.buffer = bufnr

            opts.desc = "Show LSP references"
            keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp definitions

			opts.desc = "Show code actions"
			keymap.set("n", "ga", function () vim.lsp.buf.code_action() end, opts) -- show code actions

            opts.desc = "Smart rename"
            keymap.set("n", "gR", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities());

        mason_lspconfig.setup_handlers({
            function(server)
                lsp_config[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
        })

        lsp_config["lua_ls"].setup({
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },

            lsp_config["rust_analyzer"].setup({
                on_attach = on_attach,
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true
                        },
                    }
                }
            }),

            lsp_config.cssls.setup({
                on_attach = on_attach,
                cmd = { 'vscode-css-language-server', '--stdio' },
                filetypes = { 'css', 'scss', 'less' },
                capabilities = capabilities,
                init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
                root_dir = require("lspconfig.util").root_pattern('package.json', '.git'),
                single_file_support = true,
                settings = {
                    css = { validate = true },
                    scss = { validate = true },
                    less = { validate = true },
                },
            })


        })
    end,
}
