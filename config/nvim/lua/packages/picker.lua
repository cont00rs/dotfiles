MiniDeps.now(function()
    MiniDeps.add({
        source = "folke/snacks.nvim",
    })

    vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end)
    vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files({ hidden = false, ignored = false }) end)
    vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end)
    vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end)
    vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end)
    vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end)
    vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end)
    vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end)
    vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end)
    vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end)
    vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end)
end)
