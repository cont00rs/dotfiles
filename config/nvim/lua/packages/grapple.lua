local keymap = vim.keymap.set

MiniDeps.later(function()
    MiniDeps.add({
        source = "cbochs/grapple.nvim",
    })

    require("grapple").setup({
        scope = "git",
        icons = false,
        status = false,
    })

    keymap("n", "<leader>gt", "<cmd>Grapple toggle<cr>")
    keymap("n", "<leader>gg", "<cmd>Grapple toggle_tags<cr>")
    keymap("n", "<c-j>", "<cmd>Grapple select index=1<cr>")
    keymap("n", "<c-k>", "<cmd>Grapple select index=2<cr>")
    keymap("n", "<c-l>", "<cmd>Grapple select index=3<cr>")
end)
