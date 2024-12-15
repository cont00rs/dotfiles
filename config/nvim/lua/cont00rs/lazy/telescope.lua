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
    end

    -- require('telescope').setup({
    --     local builtin = require("telescope.builtin")
    -- })


    --     local builtin = require('telescope.builtin')
    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
}
