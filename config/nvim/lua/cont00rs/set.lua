vim.g.mapleader = " "

-- Leader twice to toggle latest buffer.
vim.keymap.set("n", "<leader><leader>", "<c-^>")

vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true

vim.opt.scrolloff = 5

-- These seem no longer needed.
vim.api.nvim_create_autocmd("FileType", {
    callback = function() vim.opt_local.formatoptions:remove({ "o", "r" }) end,
})

vim.opt.path:append("**")

vim.opt.wildmode = "list:longest"
vim.opt.wildignore = "*.o,*.swp,*.mod"

-- Make trailing whitespaces explicit
vim.opt.list = true
vim.opt.listchars:append({
    trail = "·",
})

local _ = vim.api.nvim_create_augroup("MyGroup", { clear = false })

-- Jump to old location on file reopen
vim.api.nvim_create_autocmd("BufRead", {
    callback = function(opts)
        vim.api.nvim_create_autocmd('BufWinEnter', {
            once = true,
            buffer = opts.buf,
            callback = function()
                local ft = vim.bo[opts.buf].filetype
                local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
                if
                    not (ft:match('commit') and ft:match('rebase'))
                    and last_known_line > 1
                    and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
                then
                    vim.api.nvim_feedkeys([[g`"]], 'nx', false)
                end
            end,
        })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = "MyGroup",
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

-- How to define directly in lua?
vim.cmd [[:command! -bar -nargs=* Jump cexpr system('git jump --stdout ' . expand(<q-args>)) ]]
