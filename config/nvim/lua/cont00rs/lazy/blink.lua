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
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 }, { "kind" }
                    }
                }
            },

            trigger = {
                show_on_keyword = false,
                show_on_trigger_character = false,
                show_on_accept_on_trigger_character = false,
                show_on_insert_on_trigger_character = false,
            }
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
            enabled = false
        }
    },

    opts_extend = { "sources.default" }
}
