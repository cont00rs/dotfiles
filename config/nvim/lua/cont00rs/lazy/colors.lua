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
                    snacks = {
                        enabled = true,
                        indent_scope_color = "",
                    }
                }
            })

            vim.cmd("colorscheme catppuccin")
        end
    }
}
