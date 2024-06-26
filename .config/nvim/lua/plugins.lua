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
    use 'kaicataldo/material.vim'                                               -- material theme
    use 'nvim-lualine/lualine.nvim'                                             -- status line
    use 'goolord/alpha-nvim'                                                    -- dashboard
    use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' } --tabs

    -- tools
    use 's1n7ax/nvim-terminal'                  -- terminal
    use 'folke/todo-comments.nvim'              -- todo comments
    use 'j-hui/fidget.nvim'                     -- lsp progress bar
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-tree.lua'              -- file tree
    use 'nvim-telescope/telescope.nvim'         -- fzf finder
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'mg979/vim-visual-multi'                -- better editing
    use 'npxbr/glow.nvim'                       -- markdown preview
    use { 'timtro/glslView-nvim', ft = 'glsl' } -- glsl preview
    use 'rcarriga/nvim-notify'
    use 'airblade/vim-rooter'
    use 'tpope/vim-fugitive'

    -- syntax highlighting
    use 'nvim-treesitter/nvim-treesitter' -- ssyntax

    -- mason
    use "williamboman/mason.nvim" -- lsp installer
    use "williamboman/mason-lspconfig.nvim"

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'     -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'f3fora/cmp-spell'
    use 'hrsh7th/vim-vsnip'
    use 'wuelnerdotexe/vim-astro'

    -- github copilot
    use 'github/copilot.vim'

    -- debugging
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text' --inline
    use 'nvim-telescope/telescope-dap.nvim'

    -- testing
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }

    -- Snippets
    use 'L3MON4D3/LuaSnip'         --
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp

    -- language specific
    use 'mrcjkb/rustaceanvim' -- rust
    use 'saecki/crates.nvim'  -- rust cargo.toml
    use 'tikhomirov/vim-glsl' -- glsl shaders

    -- note taking
    use 'vimwiki/vimwiki'

    -- git
    use 'sindrets/diffview.nvim'
end)
