return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.10.0',


    opts = {
        keymap = {
            preset = 'default'
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = false
                },
            },

            ghost_text = {
                enabled = true
            },
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono',
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
            cmdline = {},
        },

        signature = {
            enabled = true
        }
    },

    opts_extend = { "sources.default" }
}
