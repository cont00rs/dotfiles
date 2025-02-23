return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,

        opts = {
            -- Visualise indentation level by drawing vertical bars.
            indent = {
                enabled = true,
                animate = { enabled = false },
                scope = { enabled = false },
            },

            -- Fuzzy file picker (fzf-lua replacement).
            picker = {},

            -- Use right side of statuscolumn for git signs.
            statuscolumn = {
                enabled = true,
            },
        },

        keys = {
            -- Finding buffers/files.
            {
                "<leader>fb",
                function() Snacks.picker.buffers() end,
                desc = "Buffers"
            },
            {
                "<leader>ff",
                function() Snacks.picker.files({ hidden = true, ignored = true }) end,
                desc = "Find Files"
            },
            -- Git operations.
            {
                "<leader>gd",
                function() Snacks.picker.git_diff() end,
                desc = "Git diff (hunks)"
            },
            {
                "<leader>gs",
                function() Snacks.picker.git_status() end,
                desc = "Git status"
            },
            -- Grepping and searching.
            {
                "<leader>sg",
                function() Snacks.picker.grep() end,
                desc = "Grep"
            },
            {
                "<leader>sw",
                function() Snacks.picker.grep_word() end,
                desc = "Visual selection or word",
                mode = { "n", "x" }
            },
            {
                "<leader>sb",
                function() Snacks.picker.lines() end,
                desc = "Buffer lines",
            },
            {
                "<leader>sh",
                function() Snacks.picker.help() end,
                desc = "Help pages",
            },
            {
                "<leader>ss",
                function() Snacks.picker.lsp_symbols() end,
                desc = "LSP symbols",
            },
            {
                "<leader>sS",
                function() Snacks.picker.lsp_workspace_symbols() end,
                desc = "LSP workspace symbols",
            },
            {
                "<leader>sq",
                function() Snacks.picker.qflist() end,
                desc = "Quickfix list",
            },
        }
    }
}
