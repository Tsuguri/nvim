return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local cwd = vim.fn.getcwd()

        local cargo_conf = {targetDir = "/home/tsuguri/.analyzerTarget/"}
        if cwd == "C:\\Users\\adamo\\Documents\\LIV\\liv-control-center" then
            cargo_conf["target"] = "aarch64-linux-android"
            print("using android build target")
        end

        
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    cargo = cargo_conf,
                },
            }
        })
        lspconfig.glasgow.setup({ capabilities = capabilities})
        lspconfig.clangd.setup({ capabilities = capabilities})

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }

                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, opts)
                vim.keymap.set({'n', 'v'}, '<C-l>', vim.lsp.buf.code_action, opts)
            end,
        })

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
