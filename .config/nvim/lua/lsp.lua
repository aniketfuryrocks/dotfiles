local nvim_lsp = require('lspconfig')

require "fidget".setup {} -- lsp progress bar

-- pre configured languagess
nvim_lsp.cssls.setup {
    capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } }
}
nvim_lsp.html.setup {
    capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } }
}
nvim_lsp.asm_lsp.setup {}
-- nvim_lsp["clangd"].setup {
--     capabilities = capabilities,
--     cmd = {
--       "clangd",
--       "--background-index",
--       "--suggest-missing-includes",
--       "--clang-tidy",
--       "--completion-style=bundled",
--       "--header-insertion=iwyu"
--     },
--     on_attach = on_attach,
--     flags = {debounce_text_changes = 150}
-- }
nvim_lsp.biome.setup {}
nvim_lsp.vimls.setup {}
nvim_lsp.cssmodules_ls.setup {}
nvim_lsp.pyright.setup {}
nvim_lsp.bashls.setup {}
nvim_lsp.lua_ls.setup {}
nvim_lsp.texlab.setup {}
nvim_lsp.yamlls.setup {}
nvim_lsp.astro.setup {}

vim.lsp.inlay_hint.enable(true)
vim.cmd "autocmd BufRead,BufEnter *.astro set filetype=astro"

-- nvim_lsp_installer
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_installation = true,
})

-- auto complete
local cmp = require('cmp')
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    -- Key mapping
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
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
    -- Installed sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'spell' }
    },
})
