-- install using
--
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

vim.cmd [[packadd packer.nvim]]

-- plugins
require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- asthetics
    use 'kaicataldo/material.vim' -- material theme
    use { -- status line
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'mhinz/vim-startify' -- front page

    -- tools
    use 's1n7ax/nvim-terminal' -- terminal
    use 'folke/todo-comments.nvim' -- todo comments
    use 'j-hui/fidget.nvim' -- lsp progress bar
    use 'airblade/vim-gitgutter' -- git on left side
    use { -- file tree
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        }
    }

    use { -- fzf finder
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' }

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

    -- Snippets
    use 'L3MON4D3/LuaSnip' --
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp

    -- rust
    use 'simrat39/rust-tools.nvim'
    use 'saecki/crates.nvim'

    -- glsl shaders
    use { 'timtro/glslView-nvim', ft = 'glsl' }
    use 'tikhomirov/vim-glsl'

    -- Markdown Preview
    use 'npxbr/glow.nvim'

    -- latex
    use {
        "brymer-meneses/grammar-guard.nvim",
        requires = {
            "neovim/nvim-lspconfig"
        }
    }

    -- better editing
    use 'mg979/vim-visual-multi'

end)
