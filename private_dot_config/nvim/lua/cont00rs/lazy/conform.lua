return {
    {
        "stevearc/conform.nvim",

        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    rust = { "rustfmt", lsp_format = "fallback" },
                },

                format_on_save = {
                    lsp_format = "fallback",
                    timeout_ms = 500,
                },
            })
        end
    }
}
