require('nvim-treesitter').setup({
    ensure_install = { 'rust', 'lua', 'vim', 'vimdoc', 'query' },
})

-- Enable treesitter-based highlighting (built into Neovim)
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})
