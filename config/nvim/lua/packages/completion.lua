--- Completion system.
MiniDeps.later(function()
    vim.opt.completeopt = "menuone,noinsert,fuzzy"
    require("mini.completion").setup({})
end)
