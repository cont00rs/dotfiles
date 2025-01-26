return {
    'neovim/nvim-lspconfig',

    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
        -- LSP Support
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'saghen/blink.cmp' },
    },

    config = function(_, opts)
        require("mason").setup()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,

        })

        local lspconfig = require("lspconfig")

        lspconfig.rust_analyzer.setup({
            settings = {
                ["rust_analyzer"] = {
                    cargo = {
                        allFeatures = true,
                    },
                },
            }
        })

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        verison = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = {
                            "require",
                            "vim",
                        },
                    },
                    telementary = {
                        enable = false,
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            }
        })

        for server, config in pairs(opts.servers or {}) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end
}
