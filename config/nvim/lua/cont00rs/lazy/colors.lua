return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --
    --     config = function()
    --         require("tokyonight").setup({
    --             style = "night",
    --         })
    --         vim.cmd("colorscheme tokyonight")
    --         vim.cmd("echo \" \"")
    --     end
    -- }

    {
        "zenbones-theme/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,

        -- Comments
        config = function()
            vim.g.zenbones_darkness = "stark"
            vim.g.zenbones_italic_comments = true
            vim.g.zenbones_lighten_comments = 50
            vim.g.zenbones_lighten_cursor_line = 5
            vim.cmd("colorscheme zenbones")
        end
    }
}
