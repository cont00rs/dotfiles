return {
    'stevearc/oil.nvim',
    opts = {},

    config = function()
        require("oil").setup({})
        vim.keymap.set("n", "-", "<CMD>Oil<CR>")
    end
}
