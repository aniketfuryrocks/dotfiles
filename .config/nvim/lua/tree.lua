local nvim_tree = require('nvim-tree')

nvim_tree.setup {
    update_cwd = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    view = {
        width = 30,
        hide_root_folder = true,
        side = "left",
        preserve_window_proportions = true,
        signcolumn = "yes",
    },
}

vim.g.nvim_tree_git_hl = 1
