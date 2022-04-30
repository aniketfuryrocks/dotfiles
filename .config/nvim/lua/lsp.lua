local nvim_lsp = require('lspconfig')
require "fidget".setup {} -- lsp progress bar

-- pre configured languages
nvim_lsp.tsserver.setup {}
nvim_lsp.cssls.setup {
    capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } }
}
nvim_lsp.html.setup {
    capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } }
}
nvim_lsp.clangd.setup {}
nvim_lsp.vimls.setup {}
nvim_lsp.cssmodules_ls.setup {}
nvim_lsp.pyright.setup {}
nvim_lsp.bashls.setup {}
nvim_lsp.eslint.setup {
    packageManager = "yarn"
}
nvim_lsp.sumneko_lua.setup {}
nvim_lsp.ltex.setup {}


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
    },
})

-- latex
require("grammar-guard").init()
