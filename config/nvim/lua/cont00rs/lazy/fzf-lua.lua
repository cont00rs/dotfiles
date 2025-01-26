return {
    "ibhagwan/fzf-lua",

    dependencies = {
        "junegunn/fzf",
        build = "./install --bin"
    },

    config = function()
        require("fzf-lua").setup({
            'default-title',

            keymap = {
                fzf = {
                    ["ctrl-q"] = "select-all+accept",
                }
            },
            files = {
                fd_opts = [[--color=never --type f --type l --exclude .git --hidden]],
            },
            grep = {
                rg_opts =
                "--hidden -g '!.git' --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
            }
        })
    end,

    keys = {
        { "<leader>ff", "<cmd>FzfLua files<CR>" },
        { "<leader>fb", "<cmd>FzfLua buffers<CR>" },
        { "<leader>fg", "<cmd>FzfLua live_grep<CR>" },
        { "<leader>fq", "<cmd>FzfLua quickfix<CR>" },
    }
}
