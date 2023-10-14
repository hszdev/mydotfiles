-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use ({
        'ray-x/aurora',
        as = 'aurora',
        config = function()
            -- set termguicolors = set termguicolors
            vim.opt.termguicolors = true        -- 24 bit color
            vim.g.aurora_italic = 1          -- italic
            vim.g.aurora_transparent = 1     -- transparent
            vim.g.aurora_bold = 1            -- bold
            vim.g.aurora_darker = 1          -- darker background
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use ("folke/zen-mode.nvim")
    use ('mfussenegger/nvim-jdtls')

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require('toggleterm').setup({
          open_mapping = '<C-T>',
          direction = 'horizontal',
          shade_terminals = true
        })
    end}

    -- Lua
    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    vim.opt.termguicolors = true
    require("bufferline").setup{}

    use('nanozuki/tabby.nvim')

    use("m4xshen/hardtime.nvim")

    use 'lervag/vimtex'
    use 'junegunn/vim-easy-align'
    -- Function doc support
    use {
      'kkoomen/vim-doge',
      run = ':call doge#install()'
    }
end)

