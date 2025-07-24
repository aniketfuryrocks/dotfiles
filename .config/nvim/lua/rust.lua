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
                },
                cachePriming = {
                    enable = true,
                    numThreads = 14,
                },
                workspace = {
                    symbol = {
                        search = {
                            scope = "workspace",
                            kind = "only_types",
                        },
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
    -- Additional rustaceanvim specific configurations
    tools = {
        executor = require('rustaceanvim.executors').termopen,
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            auto_focus = false,
        },
        debuggables = {
            use_telescope = true,
        },
        runnables = {
            use_telescope = true,
        },
    },
    -- DAP configuration
    dap = {
        adapter = {
            type = 'server',
            port = '${port}',
            host = '127.0.0.1',
            executable = {
                command = 'codelldb',
                args = { '--port', '${port}' },
            }
        },
        configuration = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        },
    },
}

