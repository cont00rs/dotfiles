MiniDeps.later(function()
    MiniDeps.add({
        source = "Saghen/blink.cmp",
        checkout = "v1.0.0",
    })

    require("blink.cmp").setup({
        completion = {
            accept = {
                auto_brackets = { enabled = false }
            },
        },

        signature = {
            enabled = true,
        },
    })
end)
