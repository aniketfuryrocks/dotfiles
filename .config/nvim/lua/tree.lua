local nvim_tree = require('nvim-tree')

nvim_tree.setup {
    update_cwd = true,
    open_on_tab = true,
    view = {
        width = 30
    }
}

vim.g.nvim_tree_git_hl = 1
