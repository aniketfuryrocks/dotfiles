local telescope = require('telescope')

telescope.setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

telescope.load_extension("ui-select")
telescope.load_extension("dap")
