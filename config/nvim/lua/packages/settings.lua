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
vim.opt.scrolloff = 5
vim.opt.cursorline = false
vim.opt.cursorlineopt = "line"

-- These seem no longer needed.
vim.api.nvim_create_autocmd("FileType", {
    callback = function() vim.opt_local.formatoptions:remove({ "o", "r" }) end,
})

vim.opt.path:append("**")

vim.opt.wildmode = "list:longest"
vim.opt.wildignore = "*.o,*.swp,*.mod"

-- Make trailing whitespaces explicit
-- vim.opt.list = true
-- vim.opt.listchars:append({
--     trail = "·",
-- })

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
        vim.keymap.set("n", "<leader>vl", function() vim.diagnostic.open_float({ "line" }) end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

-- Enable spell checking for certain files.
local _ = vim.api.nvim_create_augroup("Spellcheck", { clear = true })

local spell_types = { "text", "plaintex", "typst", "gitcommit", "markdown" }

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = "Spellcheck",
    pattern = spell_types,
    callback = function()
        vim.opt_local.spell = true
    end
})

-- Enable soft wrap with indentation for Markdown
local _ = vim.api.nvim_create_augroup("CustomSoftWrap", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = "CustomSoftWrap",
    pattern = { "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.breakindent = true
        vim.opt_local.breakindentopt = "shift:2"
        vim.opt_local.linebreak = true
        vim.opt_local.splitright = true
        local opts = { expr = true, silent = true, buffer = true, }
        vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", opts)
        vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", opts)
    end
})
