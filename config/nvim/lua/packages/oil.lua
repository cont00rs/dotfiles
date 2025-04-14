MiniDeps.later(function()
    MiniDeps.add({
        source = 'stevearc/oil.nvim',
    })

    require("oil").setup({
        view_options = {
            show_hidden = true,
        }
    })

    vim.keymap.set("n", "<leader>bb", function()
        vim.cmd("vsplit | wincmd l")
        require("oil").open()
    end)
end)
