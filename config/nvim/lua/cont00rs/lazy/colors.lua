return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "latte",
                integrations = {
                    cmp = false,
                    blink_cmp = true,
                    treesitter = true,
                    diffview = true,
                }
            })

            vim.cmd("colorscheme catppuccin")
        end
    }
}
