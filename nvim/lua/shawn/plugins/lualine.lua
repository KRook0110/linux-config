return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
    },
    config = function()

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                -- component_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = ''},
                section_separators = {right="",left=''},
                component_separators = { left = '┃', right = '┃'},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'filename'},
                lualine_c = {},
                -- lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_x = {'diff', 'diagnostics'},
                lualine_y = {
                    {
                        'filename',
                        file_status = true,
                        path = 1
                    }
                },
                lualine_z = {'branch'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
            },
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end,
}
