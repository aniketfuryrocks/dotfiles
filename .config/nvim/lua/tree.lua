local nvim_tree = require('nvim-tree')

nvim_tree.setup {
    update_cwd = true,
    open_on_tab = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    view = {
        width = 30,
        preserve_window_proportions = true,
        signcolumn = "yes",
        adaptive_size = true,
    },
    renderer = {
        root_folder_label = false
    }
}

vim.g.nvim_tree_git_hl = 1
