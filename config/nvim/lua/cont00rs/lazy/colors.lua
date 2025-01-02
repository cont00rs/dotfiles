return {
    -- {
    --     "savq/melange-nvim",
    --
    --     lazy = false,
    --     priority = 1000,
    --
    --     config = function()
    --         vim.cmd("colorscheme melange")
    --     end
    -- }

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},

        config = function()
            require("tokyonight").setup({
                on_colors = function(colors)
                    colors.comment = colors.orange
                end
            })

            vim.cmd("colorscheme tokyonight-night")
        end
    }
}
