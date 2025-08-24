-- Shared LSP utilities
local M = {}

-- Lazy load telescope to improve startup time
local lazy_load_telescope = function(fn_name)
    return function()
        require("telescope.builtin")[fn_name]()
    end
end

function M.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Essential LSP keybindings with lazy loading
    vim.keymap.set('n', '<leader>gd', lazy_load_telescope('lsp_definitions'), opts)
    vim.keymap.set('n', '<leader>fr', lazy_load_telescope('lsp_references'), opts)
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
end

return M
