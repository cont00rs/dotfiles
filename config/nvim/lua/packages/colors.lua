-- Colorscheme.
MiniDeps.now(function()
    MiniDeps.add({
        source = "sainnhe/gruvbox-material",
    })

    vim.opt.background = "dark"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_disable_italic_comment = true
    vim.g.gruvbox_material_enable_italic = false
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_float_style = "dim"
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    vim.g.gruvbox_material_ui_constrast = "low"

    vim.cmd("colorscheme gruvbox-material")
end)
