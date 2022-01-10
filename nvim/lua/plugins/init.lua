return require('packer').startup( function()
    use 'wbthomason/packer.nvim'    
    use 'EdenEast/nightfox.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- Auto Complete Framework
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'  -- LSP completion source for nvim-cmp
    use 'hrsh7th/vim-vsnip'     -- Snippet Engine
    use 'hrsh7th/cmp-vsnip'     -- Snippet completion source for nvim-cmp
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Autopairs
    use 'jiangmiao/auto-pairs'
    -- Statusline
    use 'nvim-lualine/lualine.nvim'

end)
