local keymap = vim.keymap.set

-- Colorscheme.
MiniDeps.now(function()
    require("mini.base16")
    vim.cmd("colorscheme minicyan")
end)

-- Completion system.
-- TODO: Make Ctrl-Y hit the auto complete.
MiniDeps.later(function()
    require("mini.completion").setup()
end)

-- Diff support for git gutter highlighting.
MiniDeps.later(function()
    require("mini.diff").setup({
        view = {
            style = 'sign',
        }
    })
end)

-- File and directory browser.
-- TODO: Is this better than Oil.nvim?
-- TODO: Should we replace commands like `:Explore`?
MiniDeps.now(function()
    require("mini.files").setup({
        mappings = {
            close = '<ESC>',
        },
        options = {
            use_as_default_explorer = true,
        },
    })

    keymap("n", "<leader>bb", function() require("mini.files").open() end)
end)

-- Icon support
MiniDeps.later(function()
    require("mini.icons").setup()
end)

-- Notification system.
MiniDeps.now(function()
    require("mini.notify").setup()
    vim.notify = require("mini.notify").make_notify()
end)

-- File picking functionality.
-- TODO: How to toggle ignore for hidden files?
-- TODO: How to search git diff (gs) and git status (gs)?
-- TODO: How to send results to quickfix?
-- TODO: How to search through quickfix?
MiniDeps.later(function()
    require("mini.pick").setup()
    keymap("n", "<leader>fb", function() require("mini.pick").builtin.buffers() end)
    keymap("n", "<leader>ff", function() require("mini.pick").builtin.files() end)
    keymap("n", "<leader>sg", function() require("mini.pick").builtin.grep_live() end)
    keymap("n", "<leader>sh", function() require("mini.pick").builtin.help() end)
    keymap("n", "<leader>sw", function() require("mini.pick").builtin.grep() end)
end)

-- Statusline updates.
MiniDeps.later(function()
    require("mini.statusline").setup()
end)

-- Trailing whitespace visualisation.
MiniDeps.later(function()
    require("mini.trailspace").setup()
end)
