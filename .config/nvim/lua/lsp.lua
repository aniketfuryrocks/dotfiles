local nvim_lsp = require('lspconfig')
require"fidget".setup{} -- lsp progress bar

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

-- lsp installer
-- local lsp_installer = require("nvim-lsp-installer")
-- 
-- lsp_installer.on_server_ready(function (server)
--    server:setup {}
-- end)

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

-- rust

require('crates').setup()
require('rust-tools').setup {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
   		executor = require("rust-tools/executors").termopen,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    hover_with_actions = {
        auto_focus = true
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importGranularity = "module",
                    importPrefix = "self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
                checkOnSave = {
                    command = "clippy"
                },
            }
        },
    	standalone = true
    },
    dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}

