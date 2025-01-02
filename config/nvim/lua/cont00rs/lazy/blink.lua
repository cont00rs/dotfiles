return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.9.0',

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
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
            cmdline = {},
        },
    },

    opts_extend = { "sources.default" }
}
