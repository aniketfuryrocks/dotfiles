-- Rust configuration using rustaceanvim

-- Import shared LSP utilities
local lsp_utils = require('lsp-utils')
local on_attach = lsp_utils.on_attach

vim.g.rustaceanvim = {
    server = {
        on_attach = on_attach,
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = true,
                check = { command = "clippy" },
                cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    buildScripts = { enable = true },
                },
                procMacro = {
                    enable = true,
                    ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                    },
                },
                inlayHints = {
                    bindingModeHints = { enable = false },
                    chainingHints = { enable = true },
                    closingBraceHints = { enable = true, minLines = 25 },
                    closureReturnTypeHints = { enable = "never" },
                    lifetimeElisionHints = { enable = "never", useParameterNames = false },
                    maxLength = 25,
                    parameterHints = { enable = true },
                    reborrowHints = { enable = "never" },
                    renderColons = true,
                    typeHints = { enable = true, hideClosureInitialization = false, hideNamedConstructor = false },
                },
            },
        },
    },
}

