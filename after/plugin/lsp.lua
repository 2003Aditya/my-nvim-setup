local lsp = require("lsp-zero")

lsp.extend_lspconfig()

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls" }, -- Use the correct name
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({}) -- Corrected the setup call

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

lsp.setup()

