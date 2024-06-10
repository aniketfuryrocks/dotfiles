require('crates').setup()

vim.g.rustaceanvim = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        default_settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "self",
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                    allFeatures = true,
                },
                procMacro = {
                    enable = true
                },
                checkOnSave = {
                    command = "clippy"
                },
            }
        },
        standalone = true
    },
    dap = {
    }
}
