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
            }
        }
    }
}
