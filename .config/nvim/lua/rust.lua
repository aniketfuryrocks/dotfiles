-- Rust configuration using rustaceanvim
-- Import shared LSP utilities
local lsp_utils = require('lsp-utils')
local on_attach = lsp_utils.on_attach

vim.g.rustaceanvim = {
    server = {
        on_attach = on_attach,
        settings = {
            ['rust-analyzer'] = {
                -- Performance optimizations
                checkOnSave = {
                    command = "clippy",
                    extraArgs = { "--no-deps" }, -- Skip dependency checking for faster analysis
                },
                cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    buildScripts = {
                        enable = true,
                        useRustcWrapper = false, -- Disable wrapper for faster builds
                    },
                    -- Limit features for faster analysis
                    features = "all",
                },
                procMacro = {
                    enable = true,
                    ignored = { -- Ignore some proc macros that may be slow
                        -- Add any problematic proc macros here
                    },
                },
                -- Cache optimization
                cachePriming = {
                    enable = true,
                    numThreads = math.min(4, vim.loop.available_parallelism() or 4), -- Limit threads to avoid CPU overload
                },
                -- Filesystem watching optimization
                files = {
                    watcher = "client", -- Use client-side file watching
                    excludeDirs = {     -- Exclude directories that don't need watching
                        ".git", "target", "node_modules", "build", "dist"
                    },
                },
                -- Memory optimization
                memoryUsage = {
                    -- Set memory limits
                    analysis = 2048, -- 2GB max for analysis
                },
                -- Disable some heavy features
                diagnostics = {
                    disabled = { -- Disable less critical diagnostics
                        "unresolved-proc-macro",
                        "missing-unsafe",
                    },
                    experimental = {
                        enable = false, -- Disable experimental diagnostics
                    },
                },
                -- Workspace symbol search optimization
                workspace = {
                    symbol = {
                        search = {
                            scope = "workspace_and_dependencies",
                            kind = "only_types",
                            limit = 1000, -- Limit results
                        },
                    },
                },
                -- Inlay hints with performance considerations
                inlayHints = {
                    bindingModeHints = { enable = false },
                    chainingHints = { enable = false },                   -- Disable for performance
                    closingBraceHints = { enable = false, minLines = 0 }, -- Disable
                    closureReturnTypeHints = { enable = "never" },
                    lifetimeElisionHints = { enable = "never" },
                    maxLength = 20,                      -- Shorter hints
                    parameterHints = { enable = false }, -- Disable parameter hints
                    reborrowHints = { enable = "never" },
                    renderColons = false,                -- Disable colon rendering
                    typeHints = {
                        enable = true,
                        hideClosureInitialization = true,
                        hideNamedConstructor = true,
                    },
                },
                -- Additional performance tweaks
                completion = {
                    autoimport = {
                        enable = true,
                    },
                },
                lens = {
                    enable = false, -- Disable code lens for better performance
                },
                hover = {
                    actions = {
                        enable = false, -- Disable hover actions
                    },
                },
            },
        },
        -- Server capabilities optimization
        capabilities = {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
            },
        },
    },
    -- Tools configuration optimized for performance
    tools = {
        executor = require('rustaceanvim.executors').termopen,
        reload_workspace_from_cargo_toml = false, -- Disable to prevent frequent reloads
        inlay_hints = {
            auto = false,                         -- Disable auto inlay hints for better performance
            only_current_line = true,             -- Only show hints for current line
            show_parameter_hints = false,
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
            use_telescope = false, -- Use built-in selector instead of telescope
        },
        runnables = {
            use_telescope = false, -- Use built-in selector instead of telescope
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
                -- Optimize debugger performance
                env = {
                    RUST_BACKTRACE = "0", -- Disable full backtrace unless needed
                },
            },
        },
    },
}
