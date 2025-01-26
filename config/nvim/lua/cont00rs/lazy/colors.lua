return {
    -- {
    --     'comfysage/evergarden',
    --     priority = 1000,
    --
    --     config = function()
    --         require("evergarden").setup({
    --             variant = "hard",
    --             style = {
    --                 comment = {},
    --             },
    --         })
    --
    --         vim.cmd("colorscheme evergarden")
    --     end
    -- }

    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "mocha",
    --             no_italic = true,
    --         })
    --
    --         vim.cmd("colorscheme catppuccin")
    --     end
    --
    -- }

    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --
    --     config = function()
    --         require("tokyonight").setup({
    --             -- styles = {
    --             --     comments = { italic = false },
    --             --     keywords = { italic = false },
    --             -- },
    --             on_colors = function(colors)
    --                 colors.comment = colors.orange
    --             end
    --         })
    --
    --         vim.cmd("colorscheme tokyonight-night")
    --     end
    -- }

    -- {
    --     "zenbones-theme/zenbones.nvim",
    --     -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    --     -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    --     -- In Vim, compat mode is turned on as Lush only works in Neovim.
    --     dependencies = "rktjmp/lush.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     -- you can set set configuration options here
    --     -- config = function()
    --     --     vim.g.zenbones_darken_comments = 45
    --     --     vim.cmd.colorscheme('zenbones')
    --     -- end
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
    --             background = {     -- map the value of 'background' option to a theme
    --                 dark = "wave", -- try "dragon" !
    --                 light = "lotus"
    --             },
    --             colors = {
    --                 theme = {
    --                     all = {
    --                         ui = {
    --                             bg_gutter = "none",
    --                         }
    --                     }
    --                 }
    --             }
    --         })
    --
    --         vim.cmd("colorscheme kanagawa")
    --     end
    -- }

    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = function()
    --         require("gruvbox").setup({
    --             transparent_mode = true,
    --         })
    --
    --         vim.cmd("colorscheme gruvbox")
    --     end
    -- }

    -- {
    --     "EdenEast/nightfox.nvim",
    --     config = function()
    --         require("nightfox").setup({
    --         })
    --
    --         vim.cmd("colorscheme carbonfox")
    --     end
    -- }
}
