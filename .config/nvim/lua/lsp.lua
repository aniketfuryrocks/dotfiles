local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("fidget").setup({}) -- lsp progress bar

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
    'html'
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        capabilities = capabilities
    })
end

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
