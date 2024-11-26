require('crates').setup()

local cfg = require('rustaceanvim.config')
local codelldb_path = "/Users/aniketprajapati/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb"
local liblldb_path = "/Users/aniketprajapati/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/lldb/lib/liblldb.dylib"

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
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    }
}
