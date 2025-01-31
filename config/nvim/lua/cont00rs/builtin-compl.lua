-- LSP Completion using native functionality.
-- This uses (part of) the gist:
-- https://gist.github.com/MariaSolOs/2e44a86f569323c478e5a078d0cf98cc.
-- A small wrapper function was needed, as found on Reddit,
-- to make this a more plug-and-play.
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf

        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local methods = vim.lsp.protocol.Methods

        ---Utility for keymap creation.
        ---@param lhs string
        ---@param rhs string|function
        ---@param opts string|table
        ---@param mode? string|string[]
        local function keymap(lhs, rhs, opts, mode)
            opts = type(opts) == 'string' and { desc = opts }
                or vim.tbl_extend('error', opts --[[@as table]], { buffer = bufnr })
            mode = mode or 'n'
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        ---For replacing certain <C-x>... keymaps.
        ---@param keys string
        local function feedkeys(keys)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
        end

        ---Is the completion menu open?
        local function pumvisible()
            return tonumber(vim.fn.pumvisible()) ~= 0
        end

        -- Enable completion and configure keybindings.
        if client.supports_method(methods.textDocument_completion) then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })

            -- Use <C-n> to navigate to the next completion or:
            -- - Trigger LSP completion.
            -- - If there's no one, fallback to vanilla omnifunc.
            keymap('<C-n>', function()
                if pumvisible() then
                    feedkeys '<C-n>'
                else
                    if next(vim.lsp.get_clients { bufnr = 0 }) then
                        vim.lsp.completion.trigger()
                    else
                        if vim.bo.omnifunc == '' then
                            feedkeys '<C-x><C-n>'
                        else
                            feedkeys '<C-x><C-o>'
                        end
                    end
                end
            end, 'Trigger/select next completion', 'i')

            -- Buffer completions.
            keymap('<C-u>', '<C-x><C-n>', { desc = 'Buffer completions' }, 'i')
        end
    end,
})
