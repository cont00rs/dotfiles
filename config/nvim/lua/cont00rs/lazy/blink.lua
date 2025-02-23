return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.12.4',


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
            },
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'normal',
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },

        cmdline = {
            enabled = false,
        },

        signature = {
            enabled = false
        }
    },

    opts_extend = { "sources.default" }
}
