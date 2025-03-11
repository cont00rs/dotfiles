return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                integrations = {
                    cmp = false,
                    blink_cmp = true,
                    treesitter = true,
                    diffview = true,
                    snacks = {
                        enabled = true,
                        indent_scope_color = "",
                    }
                }
            })

            vim.cmd("colorscheme catppuccin")
        end
    }

    -- {
    --     'sainnhe/gruvbox-material',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.g.gruvbox_material_enable_italic = true
    --         vim.g.gruvbox_material_background = 'hard'
    --         vim.cmd.colorscheme('gruvbox-material')
    --     end
    -- }
}
