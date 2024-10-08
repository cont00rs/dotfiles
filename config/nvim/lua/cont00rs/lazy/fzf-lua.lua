return {
    "ibhagwan/fzf-lua",

    dependencies = {
        "junegunn/fzf",
        build = "./install --bin"
    },

    config = function()
        require("fzf-lua").setup({'max-perf',
            winopts = {
                split = 'belowright new',
                border = false,
                preview = {
                    hidden = 'hidden',
                },
            },
        })
    end,

    keys = {
        { "<leader>ff", "<cmd>FzfLua files<CR>" },
        { "<leader>fg", "<cmd>FzfLua live_grep<CR>" },
        { "<leader>fq", "<cmd>FzfLua quickfix<CR>" },
    }
}
