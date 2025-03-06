require('crates').setup()

local cfg = require('rustaceanvim.config')
local codelldb_path = "/Users/aniketprajapati/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb"
local liblldb_path = "/Users/aniketprajapati/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/lldb/lib/liblldb.dylib"

-- Generate a random temp directory
local function get_random_tmp_dir()
    local tmp_dir = "/tmp/rust-analyzer-" .. tostring(math.random(100000, 999999))
    vim.fn.mkdir(tmp_dir, "p")  -- Create directory if not exists
    return tmp_dir
end

vim.g.rustaceanvim = {
    tools = {
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
                    command = "clippy",
                    -- extraArgs = {
                    --     "--target-dir",
                    --     get_random_tmp_dir()  -- Use dynamically created temp dir
                    -- }
                },
            }
        },
        standalone = true
    },
    dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    }
}
