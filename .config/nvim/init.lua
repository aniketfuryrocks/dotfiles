-- Disable unused providers (fixes healthcheck warnings)
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require('tweaks')
require('bindings')
require('package-manager')

-- UI/aesthetics
require('theme')
require('status_line')
require('dashboard')
require('tree')
require('tabs')

-- tools
require('terminal')
require('telescpe')
require('todo')
require('git')
require('noti')

-- syntax highlighting and lsp
-- treesitter is loaded via plugin config in plugins.lua
require('debg')
require('test')
require('lsp')
require('ai')

-- language specific
require('rust')
