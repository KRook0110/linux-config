return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        -- "SmiteshP/nvim-navic",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    lazy = false,
    -- event = "VeryLazy",

    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lsp_config = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        mason.setup({})
        mason_lspconfig.setup({
            ensure_installed = { "lua_ls" },
            automatic_installation = true,
        })

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            -- delay update diagnostics
            update_in_insert = true,
        })

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
            -- vim.lsp.inlay_hint.enable(true)
            vim.keymap.set("n", "<leader>Ni", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { desc = "Toggle Inlay Hint" })

            opts.buffer = bufnr

            opts.desc = "Show LSP references"
            -- keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
            keymap.set("n", "gr", vim.lsp.buf.references, opts)

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
            keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gI", vim.lsp.buf.implementation, opts) -- show lsp definitions

            opts.desc = "Show code actions"
            keymap.set("n", "ga", function()
                vim.lsp.buf.code_action()
            end, opts) -- show code actions

            opts.desc = "Smart rename"
            keymap.set("n", "gR", vim.lsp.buf.rename, opts) -- smart rename
        end


        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        mason_lspconfig.setup_handlers({
            function(server)
                lsp_config[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
        })

        lsp_config.ts_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "typescript-language-server", "--stdio" },
            init_options = {
                preferences = {
                    importModuleSpecifierPreference = 'relative',
                    importModuleSpecifierEnding = 'minimal',
                },
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                        languages = { "javascript", "typescript", "vue" },
                    },
                },
            },
            filetypes = {
                "javascript",
                "typescript",
                "vue",
            },
        })

        lsp_config["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
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
        })
        lsp_config.gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                gopls = {
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            },
        })
        lsp_config["rust_analyzer"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
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
                        enable = true,
                    },
                },
            },
        })

        lsp_config.cssls.setup({
            on_attach = on_attach,
            cmd = { "vscode-css-language-server", "--stdio" },
            filetypes = { "css", "scss", "less" },
            capabilities = capabilities,
            init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
            root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
            single_file_support = true,
            settings = {
                css = { validate = true },
                scss = { validate = true },
                less = { validate = true },
            },
        })
        lsp_config.jsonls.setup({
            on_attach = on_attach,
            filetypes = { "json", "jsonc" },
            settings = {
                json = {
                    -- Schemas https://www.schemastore.org
                    schemas = {
                        {
                            fileMatch = { "package.json" },
                            url = "https://json.schemastore.org/package.json"
                        },
                        {
                            fileMatch = { "tsconfig*.json" },
                            url = "https://json.schemastore.org/tsconfig.json"
                        },
                        {
                            fileMatch = {
                                ".prettierrc",
                                ".prettierrc.json",
                                "prettier.config.json"
                            },
                            url = "https://json.schemastore.org/prettierrc.json"
                        },
                        {
                            fileMatch = { ".eslintrc", ".eslintrc.json" },
                            url = "https://json.schemastore.org/eslintrc.json"
                        },
                        {
                            fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                            url = "https://json.schemastore.org/babelrc.json"
                        },
                        {
                            fileMatch = { "lerna.json" },
                            url = "https://json.schemastore.org/lerna.json"
                        },
                        {
                            fileMatch = { "now.json", "vercel.json" },
                            url = "https://json.schemastore.org/now.json"
                        },
                        {
                            fileMatch = {
                                ".stylelintrc",
                                ".stylelintrc.json",
                                "stylelint.config.json"
                            },
                            url = "http://json.schemastore.org/stylelintrc.json"
                        }
                    }
                }
            }
        })

        lsp_config.yamlls.setup({
            settings = {
                yaml = {
                    -- Schemas https://www.schemastore.org
                    schemas = {
                        ["http://json.schemastore.org/gitlab-ci.json"] = { ".gitlab-ci.yml" },
                        ["https://json.schemastore.org/bamboo-spec.json"] = {
                            "bamboo-specs/*.{yml,yaml}"
                        },
                        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                            "docker-compose*.{yml,yaml}"
                        },
                        ["http://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
                        ["http://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
                        ["http://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
                        ["http://json.schemastore.org/stylelintrc.json"] = ".stylelintrc.{yml,yaml}",
                        ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}"
                    }
                }
            }
        })
    end,
}
