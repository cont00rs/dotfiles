return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,

        config = function()
            require("tokyonight").setup({
                style = "night",
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    functions = { italic = false },
                    variables = { italic = false },
                }
            })
            vim.cmd("colorscheme tokyonight")
            vim.cmd("echo \" \"")
        end
    }
}
