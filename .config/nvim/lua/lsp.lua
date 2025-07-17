local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enhanced LSP logging for debugging
vim.lsp.set_log_level("warn")

-- Add better error handling
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.max_width = opts.max_width or 80
    opts.max_height = opts.max_height or 20
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require("fidget").setup({
    progress = {
        poll_rate = 0,
        suppress_on_insert = true,
        ignore_done_already = true,
        ignore_empty_message = true,
        display = {
            render_limit = 16,
            done_ttl = 3,
            done_icon = "✓",
            done_style = "Constant",
            progress_ttl = math.huge,
            progress_icon = { pattern = "dots", period = 1 },
            progress_style = "WarningMsg",
            group_style = "Title",
            icon_style = "Question",
            priority = 30,
            skip_history = true,
            format_message = require("fidget.progress.display").default_format_message,
            format_annote = function(msg) return msg.title end,
            format_group_name = function(group) return tostring(group) end,
            overrides = {
                rust_analyzer = { name = "rust-analyzer" },
            },
        },
    },
    notification = {
        window = {
            normal_hl = "Comment",
            winblend = 100,
            border = "none",
            zindex = 45,
            max_width = 0,
            max_height = 0,
            x_padding = 1,
            y_padding = 0,
            align = "bottom",
            relative = "editor",
        },
        view = {
            stack_upwards = true,
            icon_separator = " ",
            group_separator = "---",
            group_separator_hl = "Comment",
        },
    },
}) -- lsp progress bar

-- LSP on_attach function for buffer-local keybindings
local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Essential LSP keybindings
    vim.keymap.set('n', '<leader>gd', require("telescope.builtin").lsp_definitions, opts)
    vim.keymap.set('n', '<leader>fr', require("telescope.builtin").lsp_references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>fmt', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('n', '<A-CR>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, opts)

    -- Enable inlay hints
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Format on save
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({ async = false }) end,
        })
    end
end

-- Set up LSP servers
local servers = {
    'asm_lsp',
    'biome',
    'vimls',
    'cssmodules_ls',
    'pyright',
    'bashls',
    'lua_ls',
    'texlab',
    'yamlls',
    'astro',
    'cssls',
    'html',
    'ts_ls',
    'eslint',
    'jsonls',
    'tailwindcss',
    'marksman',                        -- Markdown
    'dockerls',                        -- Docker
    'docker_compose_language_service', -- Docker Compose
    'gopls',                           -- Go
    'clangd',                          -- C/C++
    'jdtls',                           -- Java
    'omnisharp',                       -- C#
    'phpactor',                        -- PHP
    'solargraph',                      -- Ruby
    'zls',                             -- Zig
    'cmake',                           -- CMake
    'rust_analyzer',                   -- Rust
}

-- Server-specific configurations
local server_configs = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
                hint = { enable = true },
            },
        },
    },
    rust_analyzer = {
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = true,
                check = { command = "clippy" },
            }
        }
    },
}

for _, lsp in ipairs(servers) do
    local config = {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    }

    -- Merge server-specific config if it exists
    if server_configs[lsp] then
        config = vim.tbl_deep_extend("force", config, server_configs[lsp])
    end

    nvim_lsp[lsp].setup(config)
end


-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})


vim.lsp.inlay_hint.enable(true)
vim.cmd("autocmd BufRead,BufEnter *.astro set filetype=astro")

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- Auto complete
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    }),
})

-- Crates.nvim setup for Rust Cargo.toml support
require('crates').setup()
