MiniDeps.later(function()
    MiniDeps.add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function() vim.cmd("TSUpdate") end,
        },
    })

    require("nvim-treesitter.configs").setup({
        auto_install = false,
        ensure_installed = {
            "c",
            "lua",
            "python",
            "rust",
            "vim",
            "vimdoc",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        sync_install = false,
    })
end)
