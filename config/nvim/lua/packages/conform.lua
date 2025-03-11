MiniDeps.later(function()
    MiniDeps.add({
        source = "stevearc/conform.nvim",
    })

    require("conform").setup({
        formatters_by_ft = {
            rust = { "rustfmt", lsp_format = "fallback" },
            python = { "ruff_format" },
            markdown = { "mdformat" },
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    })
end)
