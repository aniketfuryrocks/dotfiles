local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("fidget").setup({}) -- lsp progress bar

-- LSP on_attach function for buffer-local keybindings
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }
    
    -- LSP keybindings
    buf_set_keymap('n', '<leader>gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
    buf_set_keymap('n', '<leader>gt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', opts)
    buf_set_keymap('n', '<leader>fi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
    buf_set_keymap('n', '<leader>fr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
    buf_set_keymap('n', '<A-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
    buf_set_keymap('n', '<leader>fas', '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', opts)
    buf_set_keymap('n', '<leader>fmt', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>dig', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
    
    -- Enable inlay hints if supported
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
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
    'tailwindcss'
}

-- Server-specific configurations
local server_configs = {
    ts_ls = {
        init_options = {
            preferences = {
                disableSuggestions = true
            }
        },
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = 'all',
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                }
            }
        }
    },
    eslint = {
        settings = {
            workingDirectory = { mode = "auto" }
        }
    }
}

for _, lsp in ipairs(servers) do
    local config = {
        capabilities = capabilities,
        on_attach = on_attach
    }
    
    -- Merge server-specific config if it exists
    if server_configs[lsp] then
        config = vim.tbl_deep_extend("force", config, server_configs[lsp])
    end
    
    nvim_lsp[lsp].setup(config)
end

-- Custom diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
    },
    float = {
        source = "always",
        border = "rounded",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- LSP handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
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
            -- Choose either VSnip or LuaSnip, not both
            vim.fn["vsnip#anonymous"](args.body)
            -- or for LuaSnip:
            -- require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },  -- or 'luasnip' if using LuaSnip
        { name = 'path' },
        { name = 'buffer' },
        { name = 'spell' }
    },
})
