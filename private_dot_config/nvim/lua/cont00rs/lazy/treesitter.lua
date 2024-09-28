return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "python", "vim", "vimdoc"},
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
