return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
        local builtin = require("telescope.builtin")
        local ivy = require('telescope.themes').get_ivy()
        vim.keymap.set("n", "<leader>ff", function() builtin.find_files(ivy) end)
        vim.keymap.set('n', '<leader>fg', function() builtin.live_grep(ivy) end)
        vim.keymap.set('n', '<leader>fq', function() builtin.quickfix(ivy) end)
        vim.keymap.set('n', '<leader>gs', function() builtin.git_status(ivy) end)

        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<C-Q>"] = actions.send_selected_to_qflist + actions.open_qflist
                    }
                }
            }
        })
    end
}
