-- LSP
MiniDeps.later(function()
    MiniDeps.add({
        source = 'neovim/nvim-lspconfig',
        depends = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    })

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

    vim.diagnostic.enable()
    vim.diagnostic.config({ virtual_text = true })
end)
