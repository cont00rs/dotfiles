-- Colorscheme.
MiniDeps.later(function()
    MiniDeps.add({
        source = "sainnhe/gruvbox-material",
    })

    vim.opt.background = "dark"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_enable_italic = false
    vim.cmd("colorscheme gruvbox-material")
end)
