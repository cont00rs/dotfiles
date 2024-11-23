return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.7.6',

    opts = {
        keymap = {
            preset = 'default'
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },

        completion = {
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind" }
                    },
                }
            },
        },

        sources = {
            completion = {
                enabled_providers = { 'lsp', 'path', 'buffer' },
            },
        },
    },

    opts_extend = { "sources.completion.enabled_providers" }
}
