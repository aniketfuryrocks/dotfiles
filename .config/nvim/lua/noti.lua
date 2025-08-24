local notify = require('notify')
notify.setup({
    render = "minimal",

    timeout = 4000,

    minimum_width = 20,
    max_width = 60,
})

vim.notify = notify
