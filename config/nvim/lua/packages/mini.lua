-- Diff support for git gutter highlighting.
MiniDeps.later(function()
    require("mini.diff").setup({
        view = {
            style = 'sign',
        }
    })
end)

-- Icon support
MiniDeps.later(function()
    require("mini.icons").setup()
end)

-- Notification system.
MiniDeps.now(function()
    require("mini.notify").setup({
        lsp_progress = {
            enable = false,
        },
    })
    vim.notify = require("mini.notify").make_notify()
end)

-- Statusline updates.
MiniDeps.later(function()
    require("mini.statusline").setup()
end)

-- Trailing whitespace visualisation.
MiniDeps.later(function()
    require("mini.trailspace").setup()
end)
