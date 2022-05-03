local nvim_tree = require('nvim-tree')

nvim_tree.setup {
    update_cwd = true,
    open_on_tab = true,
    view = {
        width = 30
    }
}

vim.g.nvim_tree_git_hl = 1

require('nvim-tree.events').on_tree_open(function ()
   require'bufferline.state'.set_offset(30)
   require'nvim-tree'.find_file(true)
end)

require('nvim-tree.events').on_tree_close(function ()
    require'bufferline.state'.set_offset(0)
end)
