local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
    return
end

mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" }
})


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
}


lspconfig.sumneko_lua.setup(
    vim.tbl_deep_extend("force",
        require("user.lsp.settings.sumneko_lua"),
        opts
    )
)

lspconfig.pyright.setup(opts)
