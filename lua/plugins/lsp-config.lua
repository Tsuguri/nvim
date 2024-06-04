return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.rust_analyzer.setup({})

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
        vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, {})
        vim.keymap.set({'n', 'v'}, '<C-l>', vim.lsp.buf.code_action, {})

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp", { clear = true }),
            callback = function(args)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format { async = false, id = args.data.client_id }
                    end,
                })

            end
        })
    end

}
