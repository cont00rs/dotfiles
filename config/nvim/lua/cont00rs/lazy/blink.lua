return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.11.0',


    opts = {
        keymap = {
            preset = 'default',

            ['<C-y>'] = { 'show', 'accept' },
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = false
                },
            },

            ghost_text = {
                enabled = false
            },

            menu = {
                scrollbar = false,
                border = 'none',
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 }, { "kind" }
                    }
                }
            },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
            cmdline = {},
        },

        signature = {
            enabled = false
        }
    },

    opts_extend = { "sources.default" }
}
