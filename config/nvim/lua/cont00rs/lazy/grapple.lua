return {
    {
        "cbochs/grapple.nvim",

        opts = {
            scope = "git",
            icons = false,
            status = false,
        },

        keys = {
            { "<leader>gt", "<cmd>Grapple toggle<cr>",         desc = "Tag a file" },
            { "<leader>gg", "<cmd>Grapple toggle_tags<cr>",    desc = "Show tags menu" },

            { "<c-j>",      "<cmd>Grapple select index=1<cr>", desc = "Select tag 1" },
            { "<c-k>",      "<cmd>Grapple select index=2<cr>", desc = "Select tag 2" },
            { "<c-l>",      "<cmd>Grapple select index=3<cr>", desc = "Select tag 3" },
        }
    }
}
