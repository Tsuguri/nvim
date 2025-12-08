return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = 'main',
    config = function()
        require("nvim-treesitter").setup{
            install_dir = vim.fn.stdpath('data') .. '/site'
        }
        -- local config = require("nvim-treesitter.configs")
        -- config.setup({
        --         ensure_installed = {"lua", "rust", "cpp"},
        --         highlight = {enable = true},
        --         indent = {enable = true},
        -- })

    end
}
