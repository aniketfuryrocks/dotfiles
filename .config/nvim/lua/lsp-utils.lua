-- Shared LSP utilities
local M = {}

-- LSP on_attach function for buffer-local keybindings
function M.on_attach(client, bufnr)
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

return M

