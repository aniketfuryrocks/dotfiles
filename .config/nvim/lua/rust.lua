-- Rust configuration using rustaceanvim
-- Import shared LSP utilities
local lsp_utils = require('lsp-utils')
local on_attach = lsp_utils.on_attach

-- Supports for crates versioning
require('crates').setup({})

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
                    allFeatures = true, -- Enable all features for better analysis
                    loadOutDirsFromCheck = true,
                    buildScripts = {
                        enable = true,
                        useRustcWrapper = true, -- Enable wrapper for better macro support
                    },
                    runBuildScripts = true, -- Enable build script execution
                },
                procMacro = {
                    enable = true,
                    attributes = {
                        enable = true,
                    },
                    ignored = {}, -- Don't ignore proc macros by default
                },
                -- Cache optimization with better defaults
                cachePriming = {
                    enable = true,
                    numThreads = math.min(6, vim.loop.available_parallelism() or 4),
                },
                -- Improve workspace symbol performance
                completion = {
                    autoimport = {
                        enable = true,
                    },
                    callable = {
                        snippets = "fill_arguments",
                    },
                },
                -- Better incremental compilation support
                rustfmt = {
                    extraArgs = {},
                    overrideCommand = nil,
                },
                -- Filesystem watching optimization
                files = {
                    watcher = "client", -- Use client-side file watching
                    excludeDirs = {     -- Exclude directories that don't need watching
                        ".git", "target", "node_modules", "build", "dist"
                    },
                    watcherExclude = {}, -- Don't exclude Cargo.toml and related files
                },
                -- Memory optimization
                memoryUsage = {
                },
                -- Balanced diagnostics configuration
                diagnostics = {
                    enable = true,
                    disabled = {
                        -- Only disable truly noisy diagnostics
                        "inactive-code", -- Can be noisy in conditional compilation
                        "unreachable-label", -- Usually not critical
                    },
                    experimental = {
                        enable = false,
                    },
                    enableExperimental = false,
                    remapPrefix = {},
                    refresh = {
                        enable = true,
                        workspace = true, -- Refresh diagnostics on workspace changes
                    },
                },
                -- Inlay hints with performance considerations
                inlayHints = {
                    bindingModeHints = { enable = false },
                    chainingHints = { enable = false },                   -- Disable for performance
                    maxLength = 20,                      -- Shorter hints
                    parameterHints = { enable = false }, -- Disable parameter hints
                    reborrowHints = { enable = "never" },
                    typeHints = {
                        enable = true,
                        hideClosureInitialization = true,
                        hideNamedConstructor = true,
                    },
                },
                lens = {
                    enable = true, -- Disable code lens for better performance
                },
                hover = {
                    actions = {
                        enable = true, -- Enable hover actions
                    },
                },
                -- Check configuration for clippy
                check = {
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                    allTargets = true, -- Check all targets for comprehensive analysis
                    allFeatures = true, -- Match cargo.allFeatures setting
                },
            },
        },
        -- Server capabilities optimization
        capabilities = {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = true,
                },
                didChangeConfiguration = {
                    dynamicRegistration = true,
                },
                configuration = true,
                workspaceFolders = true,
            },
            textDocument = {
                completion = {
                    completionItem = {
                        snippetSupport = true,
                    },
                },
            },
        },
    },
    -- Tools configuration optimized for performance
    tools = {
        executor = require('rustaceanvim.executors').termopen,
        reload_workspace_from_cargo_toml = true, -- Enable to detect Cargo.toml changes
        inlay_hints = {
            auto = true,                         -- Disable auto inlay hints for better performance
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
    -- dap = {
    --     adapter = {
    --         type = 'server',
    --         port = '${port}',
    --         host = '127.0.0.1',
    --         executable = {
    --             command = 'codelldb',
    --             args = { '--port', '${port}' },
    --         }
    --     },
    --     configuration = {
    --         {
    --             name = "Launch file",
    --             type = "codelldb",
    --             request = "launch",
    --             program = function()
    --                 return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    --             end,
    --             cwd = '${workspaceFolder}',
    --             stopOnEntry = false,
    --             -- Optimize debugger performance
    --             env = {
    --                 RUST_BACKTRACE = "0", -- Disable full backtrace unless needed
    --             },
    --         },
    --     },
    -- },
}
