-- Close 'mini.nvim' manually in a way that it gets managed by 'mini.deps'.
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/nvim-mini/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps'.
require("mini.deps").setup({
    path = {
        package = path_package,
    }
})


-- Define (neo)vim settings and configurations.
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

vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')

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
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vl", function() vim.diagnostic.open_float({ "line" }) end, opts)
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

-- Enable highlight on yank to clarify selections made. The autocmd
-- is taken fromt he `vim.hl.on_yank` help pages.
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.hl.on_yank { higroup = 'Visual', timeout = 300 }
    end
})

-- Define colorscheme.
MiniDeps.now(function()
    MiniDeps.add({
        source = "folke/tokyonight.nvim"
    })
end)

vim.opt.background = "dark"
vim.cmd.colorscheme("tokyonight-night")

-- Code completion system.
MiniDeps.now(function()
    MiniDeps.add({
        source = "Saghen/blink.cmp",
        checkout = "v1.6.0",
    })

    require("blink.cmp").setup({
        cmdline = {
            enabled = false,
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = false
                },
            },
            ghost_text = {
                enabled = false,
            },

            -- FIXME: How to disable expanding snippets?
            -- The workaround is to not preselect, move onto the
            -- match with <C-n> rather than <C-y> and only expand
            -- the match, not the corresponding snippet.
            list = {
                selection = {
                    preselect = false,
                },
            },
        },

        signature = {
            enabled = true,
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
        }
    })
end)

-- Code (auto)formatting support.
MiniDeps.later(function()
    MiniDeps.add({
        source = "stevearc/conform.nvim",
    })

    require("conform").setup({
        formatters_by_ft = {
            rust = { "rustfmt", lsp_format = "fallback" },
            python = { "ruff_format" },
            markdown = { "mdformat" },
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    })
end)

-- More support for viewing diffs.
MiniDeps.later(function()
    MiniDeps.add({
        source = "sindrets/diffview.nvim",
    })

    require("diffview").setup({
        use_icons = false,
    })
end)

-- Git integration
MiniDeps.later(function()
    MiniDeps.add({
        source = "tpope/vim-fugitive",
    })
end)


-- Move around main files through keybind tag-like behavior.
MiniDeps.later(function()
    MiniDeps.add({
        source = "cbochs/grapple.nvim",
    })

    require("grapple").setup({
        scope = "git",
        icons = false,
        status = false,
    })

    vim.keymap.set("n", "<leader>gt", "<cmd>Grapple toggle<cr>")
    vim.keymap.set("n", "<leader>gg", "<cmd>Grapple toggle_tags<cr>")
    vim.keymap.set("n", "<c-j>", "<cmd>Grapple select index=1<cr>")
    vim.keymap.set("n", "<c-k>", "<cmd>Grapple select index=2<cr>")
    vim.keymap.set("n", "<c-l>", "<cmd>Grapple select index=3<cr>")
end)

-- Language server protocol implementation and configuration.
MiniDeps.now(function()
    MiniDeps.add({
        source = 'neovim/nvim-lspconfig',
        depends = {
            'mason-org/mason.nvim',
            'mason-org/mason-lspconfig.nvim',
        }
    })

    require("mason").setup()

    require("mason-lspconfig").setup({
        automatic_enable = true,
    })

    local lspconfig = require("lspconfig")

    lspconfig.rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
                completion = {
                    postfix = {
                        enable = false,
                    },
                },
            },
        },
    })

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                telementary = {
                    enable = false,
                },
                workspace   = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            },
        }
    })

    vim.diagnostic.enable()
    vim.diagnostic.config({ virtual_text = true })
end)

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

-- A file tree (netrw) browser alternative.
MiniDeps.later(function()
    MiniDeps.add({
        source = 'stevearc/oil.nvim',
    })

    require("oil").setup({
        view_options = {
            show_hidden = true,
        }
    })

    vim.keymap.set("n", "<leader>bb", function()
        vim.cmd("vsplit | wincmd l")
        require("oil").open()
    end)
end)

-- Fuzzy finding and its keymaps.
MiniDeps.now(function()
    MiniDeps.add({
        source = "ibhagwan/fzf-lua",
    })

    require("fzf-lua").setup({
        "default",
        winopts = {
            fullscreen = true,
        },
        keymap = {
            fzf = {
                ["ctrl-q"] = "select-all+accept",
            },
        },
    })

    vim.keymap.set("n", "<leader>fb", function() require("fzf-lua").buffers() end)
    vim.keymap.set("n", "<leader>ff", function() require("fzf-lua").files() end)

    vim.keymap.set("n", "<leader>gd", function() require("fzf-lua").git_diff() end)
    vim.keymap.set("n", "<leader>gs", function() require("fzf-lua").git_status() end)

    vim.keymap.set("n", "<leader>sb", function() require("fzf-lua").lines() end)
    vim.keymap.set("n", "<leader>sg", function() require("fzf-lua").live_grep() end)
    vim.keymap.set("n", "<leader>sh", function() require("fzf-lua").helptags() end)
    vim.keymap.set("n", "<leader>sl", function() require("fzf-lua").diagnostics_document() end)
    vim.keymap.set("n", "<leader>sL", function() require("fzf-lua").diagnostics_workspace() end)
    vim.keymap.set("n", "<leader>ss", function() require("fzf-lua").lsp_document_symbols() end)
    vim.keymap.set("n", "<leader>sS", function() require("fzf-lua").lsp_workspace_symbols() end)
    vim.keymap.set("n", "<leader>sq", function() require("fzf-lua").qflist() end)
    vim.keymap.set({ "n", "x" }, "<leader>sw", function() require("fzf-lua").grep_visual() end)
end)

-- Apply treesitter for highlighting.
MiniDeps.later(function()
    MiniDeps.add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function() vim.cmd("TSUpdate") end,
        },
    })

    require("nvim-treesitter.configs").setup({
        auto_install = false,
        ensure_installed = {
            "c",
            "lua",
            "python",
            "rust",
            "vim",
            "vimdoc",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = 'vim',
        },
        sync_install = false,
    })
end)
