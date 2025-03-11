MiniDeps.later(function()
    MiniDeps.add({
        source = "sindrets/diffview.nvim",
    })

    require("diffview").setup({
        use_icons = true,
    })
end)
