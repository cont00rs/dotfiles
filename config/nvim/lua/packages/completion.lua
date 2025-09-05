--- Completion system.
MiniDeps.now(function()
    MiniDeps.add({
        source = "Saghen/blink.cmp",
        checkout = "v1.4.1",
    })

    require("blink.cmp").setup({
        cmdline = {
            enabled = false,
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = false
                },
            },
            ghost_text = {
                enabled = false,
            },

            -- FIXME: How to disable expanding snippets?
            -- The workaround is to not preselect, move onto the
            -- match with <C-n> rather than <C-y> and only expand
            -- the match, not the corresponding snippet.
            list = {
                selection = {
                    preselect = false,
                },
            },
        },

        signature = {
            enabled = true,
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
        }
    })
end)
