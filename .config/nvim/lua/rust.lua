-- Rust configuration using rustaceanvim
-- Import shared LSP utilities
local lsp_utils = require('lsp-utils')
local on_attach = lsp_utils.on_attach

-- Supports for crates versioning
require('crates').setup({})

-- Check if a Cargo.toml at given path contains [workspace]
---@param cargo_toml_path string
---@return boolean
local function is_workspace_cargo(cargo_toml_path)
    if vim.fn.filereadable(cargo_toml_path) ~= 1 then
        return false
    end
    local content = vim.fn.readfile(cargo_toml_path)
    for _, line in ipairs(content) do
        if line:match('%[workspace%]') then
            return true
        end
    end
    return false
end

-- Find the workspace root from a given directory by walking up
-- Returns the directory containing the workspace Cargo.toml, or nil
---@param start_dir string
---@return string|nil
local function find_workspace_root(start_dir)
    local cargo_tomls = vim.fs.find('Cargo.toml', {
        upward = true,
        path = start_dir,
        limit = math.huge, -- Find all Cargo.toml files going up
    })

    -- Check each Cargo.toml from nearest to farthest
    for _, cargo_toml in ipairs(cargo_tomls) do
        if is_workspace_cargo(cargo_toml) then
            return vim.fs.dirname(cargo_toml)
        end
    end
    return nil
end

-- Find the nearest Cargo.toml from a given directory
---@param start_dir string
---@return string|nil
local function find_nearest_cargo_root(start_dir)
    local cargo_toml = vim.fs.find('Cargo.toml', {
        upward = true,
        path = start_dir,
    })[1]

    if cargo_toml then
        return vim.fs.dirname(cargo_toml)
    end
    return nil
end

-- Determine the best root directory for rust-analyzer
-- Priority:
-- 1. If current file is under a workspace, use the workspace root
-- 2. Otherwise, use the nearest Cargo.toml directory
-- 3. For standalone .rs files, use the file's directory
---@param filename string
---@return string|nil
local function get_rust_root(filename)
    local file_dir = vim.fs.dirname(filename)

    -- First, check if we're inside a workspace
    local workspace_root = find_workspace_root(file_dir)
    if workspace_root then
        return workspace_root
    end

    -- Next, find the nearest Cargo.toml
    local cargo_root = find_nearest_cargo_root(file_dir)
    if cargo_root then
        return cargo_root
    end

    -- For standalone .rs files, just use the file's directory
    return file_dir
end

-- Helper function to find all Cargo.toml files under a directory
-- Used for linkedProjects when there's no workspace
---@param root_dir string
---@return string[]
local function discover_cargo_manifests(root_dir)
    local manifests = {}

    -- Use fd if available (faster), fallback to find
    local cmd
    if vim.fn.executable('fd') == 1 then
        cmd = { 'fd', '--type', 'f', '--hidden', '--no-ignore', 'Cargo.toml', root_dir, '--exclude', 'target' }
    else
        cmd = { 'find', root_dir, '-name', 'Cargo.toml', '-not', '-path', '*/target/*' }
    end

    local result = vim.fn.systemlist(cmd)
    if vim.v.shell_error == 0 then
        for _, path in ipairs(result) do
            if path and path ~= '' then
                table.insert(manifests, path)
            end
        end
    end

    return manifests
end

-- Get linkedProjects for a given project root
-- Only needed when there's no workspace at the root
---@param project_root string|nil
---@return string[]
local function get_linked_projects(project_root)
    if not project_root then
        return {}
    end

    -- Check if there's a workspace at the project root
    local root_cargo = project_root .. '/Cargo.toml'
    if is_workspace_cargo(root_cargo) then
        -- rust-analyzer handles workspaces automatically
        return {}
    end

    -- For non-workspace roots, discover all Cargo.toml files
    return discover_cargo_manifests(project_root)
end

vim.g.rustaceanvim = {
    server = {
        on_attach = on_attach,
        -- Custom root_dir function to handle multi-workspace projects
        -- This finds the appropriate root based on the buffer's location
        root_dir = function(filename, default)
            local root = get_rust_root(filename)
            if root then
                return root
            end
            -- Fallback to rustaceanvim's default detection
            return default(filename)
        end,
        -- Dynamically generate settings based on the actual project root
        settings = function(project_root)
            -- Get linkedProjects based on the actual project root, not cwd
            local linked = get_linked_projects(project_root)

            return {
                ['rust-analyzer'] = {
                    -- Link standalone crates when no workspace exists
                    linkedProjects = linked,
                    -- Performance optimizations
                    checkOnSave = true,
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        buildScripts = {
                            enable = true,
                            useRustcWrapper = true,
                        },
                        runBuildScripts = true,
                    },
                    procMacro = {
                        enable = true,
                        attributes = {
                            enable = true,
                        },
                    },
                    cachePriming = {
                        enable = true,
                        numThreads = math.min(6, vim.loop.available_parallelism() or 4),
                    },
                    completion = {
                        autoimport = {
                            enable = true,
                        },
                        callable = {
                            snippets = "fill_arguments",
                        },
                    },
                    rustfmt = {
                        extraArgs = {},
                        overrideCommand = nil,
                    },
                    files = {
                        watcher = "client",
                        excludeDirs = {
                            ".git", "target", "node_modules", "build", "dist"
                        },
                        watcherExclude = {},
                    },
                    memoryUsage = {},
                    diagnostics = {
                        enable = true,
                        disabled = {
                            "inactive-code",
                            "unreachable-label",
                            -- WIP-friendly: don't error on missing path dependencies
                            "unresolved-extern-crate",
                        },
                        experimental = {
                            enable = false,
                        },
                        enableExperimental = false,
                    },
                    inlayHints = {
                        bindingModeHints = { enable = false },
                        chainingHints = { enable = false },
                        maxLength = 20,
                        parameterHints = { enable = false },
                        reborrowHints = { enable = "never" },
                        typeHints = {
                            enable = true,
                            hideClosureInitialization = true,
                            hideNamedConstructor = true,
                        },
                    },
                    lens = {
                        enable = true,
                    },
                    hover = {
                        actions = {
                            enable = true,
                        },
                    },
                    check = {
                        command = "clippy",
                        extraArgs = { "--no-deps" },
                        allTargets = true,
                        allFeatures = true,
                    },
                },
            }
        end,
        -- Notify on warnings but not errors (less intrusive for WIP projects)
        status_notify_level = 'warning',
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
    tools = {
        executor = require('rustaceanvim.executors').termopen,
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = true,
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
            use_telescope = false,
        },
        runnables = {
            use_telescope = false,
        },
    },
}
