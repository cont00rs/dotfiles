return {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.6.2',

    completion = {
        menu = {
            draw = {
                columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
            },
        },
    },

    opts = {
        keymap = {
            preset = 'default'
        },

        highlight = {
            use_nvim_cmp_as_default = true,
        },

        nerd_font_variant = 'mono',

        sources = {
            completion = {
                enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
    },

    opts_extend = { "sources.completion.enabled_providers" }
}
