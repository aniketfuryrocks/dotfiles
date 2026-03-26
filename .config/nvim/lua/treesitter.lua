require('nvim-treesitter').setup({
    ensure_installed = { 'rust', 'lua', 'vim', 'vimdoc', 'query', 'swift' },
})

-- Enable treesitter-based highlighting (built into Neovim)
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})
