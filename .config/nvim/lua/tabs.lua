require('bufferline').setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "..",
                highlight = "Directory",
                text_align = "left"
            }
        },
        color_icons = true,
        diagnostics = "nvim_lsp",
    }
}
