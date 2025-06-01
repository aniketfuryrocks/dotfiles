-- If using crates.nvim, ensure it's installed and configured separately
require('crates').setup()

local cfg = require('rustaceanvim.config')

-- Use Mason-installed codelldb (more portable) or fallback to VSCode's
local codelldb_path = vim.fn.stdpath('data') .. '/mason/bin/codelldb'
local liblldb_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib'

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
          extraArgs = {
            "--target-dir",
            "/tmp/rust-analyzer-check"  -- Fixed directory
          }
        },
      }
    },
    standalone = true  -- Remove unless explicitly needed
  },
  dap = {
    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  }
}
