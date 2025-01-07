return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                no_italic = true,
            })

            vim.cmd("colorscheme catppuccin")
        end

    }
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --
    --     config = function()
    --         require("tokyonight").setup({
    --             styles = {
    --                 comments = { italic = false },
    --                 keywords = { italic = false },
    --             },
    --             -- on_colors = function(colors)
    --             --     colors.comment = colors.orange
    --             -- end
    --         })
    --
    --         vim.cmd("colorscheme tokyonight-night")
    --     end
    -- }

    -- {
    --     "rebelot/kanagawa.nvim",
    --
    --     config = function()
    --         require('kanagawa').setup({
    --             compile = false, -- enable compiling the colorscheme
    --             commentStyle = { italic = true },
    --             keywordStyle = { italic = true },
    --             statementStyle = { bold = true },
    --             theme = "wave",    -- Load "wave" theme when 'background' option is not set
    --             background = {     -- map the value of 'background' option to a theme
    --                 dark = "wave", -- try "dragon" !
    --                 light = "lotus"
    --             },
    --         })
    --
    --         vim.cmd("colorscheme kanagawa")
    --     end
    -- }

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

    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = function()
    --         require("gruvbox").setup({
    --             contrast = "hard",
    --             transparent_mode = true,
    --         })
    --
    --         vim.cmd("colorscheme gruvbox")
    --     end
    -- }
}
