vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"
vim.opt.formatoptions:remove { "c", "r", "o" }
-- vim.diagnostic.config({ virtual_text = true })
vim.o.winborder = 'rounded'
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevelstart = 8
vim.opt.foldnestmax = 12

