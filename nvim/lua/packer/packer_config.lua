-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    --LSP
    use { "neoclide/coc.nvim", branch = "release" }

    -- Enhancements
    use "preservim/nerdcommenter"
    use 'itchyny/lightline.vim'

    use { "dstein64/nvim-scrollview", branch = 'main' }
    use 'Yggdroot/indentLine'

    use "ryanoasis/vim-devicons"
    use "nvim-tree/nvim-web-devicons"
    use { 'liuchengxu/vim-clap', run = ':Clap install-binary' }

    use { 'dart-lang/dart-vim-plugin' }
    use "preservim/nerdtree"
    use "tpope/vim-surround"

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                map_cr = false
            }
        end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.x",
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    -- Theme
    use "ellisonleao/gruvbox.nvim"

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup {
            open_mapping = [[<leader>t]],
            size = 20,
            persist_size = true,
            persist_mode = true,
            direction = 'float',
            insert_mappings = false,
            float_opts = {
                border = 'curved',
            },
        }
    end }
end)
