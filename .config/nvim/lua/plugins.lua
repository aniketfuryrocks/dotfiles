return {
    -- Lazy.nvim itself
    {
        "folke/lazy.nvim",
    },

    -- Common deps
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    -- UI/Aesthetics
    { "kaicataldo/material.vim" },   -- material theme
    { "nvim-lualine/lualine.nvim" }, -- status line
    { "goolord/alpha-nvim" },        -- dashboard
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    }, -- tabs

    -- Tools
    { "s1n7ax/nvim-terminal" },     -- terminal
    { "folke/todo-comments.nvim" }, -- todo comments
    { "j-hui/fidget.nvim" },        -- lsp progress bar
    { "lewis6991/gitsigns.nvim" },
    { "kyazdani42/nvim-tree.lua" }, -- file tree
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },                            -- fzf finder
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "mg979/vim-visual-multi" }, -- better editing
    { "npxbr/glow.nvim" },        -- markdown preview
    {
        "timtro/glslView-nvim",
        ft = "glsl"
    }, -- glsl preview
    { "rcarriga/nvim-notify" },
    { "airblade/vim-rooter" },
    { "tpope/vim-fugitive" },

    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'main',
        lazy = false,
        build = ":TSUpdate",
        setup = function()
            require('treesitter')
        end
    },

    -- Mason
    { "williamboman/mason.nvim" }, -- lsp installer
    { "williamboman/mason-lspconfig.nvim" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },     -- Autocompletion plugin
    { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "f3fora/cmp-spell" },
    { "hrsh7th/vim-vsnip" },
    { "wuelnerdotexe/vim-astro" },

    -- GitHub Copilot
    { "github/copilot.vim" },

    -- Debugging
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" }, -- inline
    { "nvim-telescope/telescope-dap.nvim" },

    -- Testing
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    },

    -- Snippets
    { "L3MON4D3/LuaSnip",        run = "make install_jsregexp" }, -- Snippets plugin
    { "saadparwaiz1/cmp_luasnip" },                        -- Snippets source for nvim-cmp

    -- Language specific
    { "saecki/crates.nvim" }, -- rust cargo.toml
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        ft = { "rust" },
    },
    { "tikhomirov/vim-glsl" }, -- glsl shaders

    -- Note taking
    { "vimwiki/vimwiki" },

    -- Git
    { "sindrets/diffview.nvim" },
}
