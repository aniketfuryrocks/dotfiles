-- install using
--
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

vim.cmd [[packadd packer.nvim]]

-- plugins
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- common deps
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- ui/asthetics
    use 'kaicataldo/material.vim' -- material theme
    use 'nvim-lualine/lualine.nvim' -- status line
    use 'goolord/alpha-nvim' -- dashboard
    use 'romgrk/barbar.nvim' -- tab bar

    -- tools
    use 's1n7ax/nvim-terminal' -- terminal
    use 'folke/todo-comments.nvim' -- todo comments
    use 'j-hui/fidget.nvim' -- lsp progress bar
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-tree.lua' -- file tree
    use 'nvim-telescope/telescope.nvim' -- fzf finder
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'mg979/vim-visual-multi' -- better editing
    use 'npxbr/glow.nvim' -- markdown preview
    use { 'timtro/glslView-nvim', ft = 'glsl' } -- glsl preview
    use 'rcarriga/nvim-notify'
    use 'airblade/vim-rooter'

    -- syntax highlighting
    use 'nvim-treesitter/nvim-treesitter' -- ssyntax
    use 'lewis6991/spellsitter.nvim' -- spellings

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- debugging
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text' --inline
    use 'nvim-telescope/telescope-dap.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip' --
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp

    -- language specific
    use 'simrat39/rust-tools.nvim' -- rust
    use 'saecki/crates.nvim' -- rust cargo.toml
    use 'tikhomirov/vim-glsl' -- glsl shaders
    use 'brymer-meneses/grammar-guard.nvim' -- latex

end)
