-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use { "wbthomason/packer.nvim" }

    --LSP 
    use {"neoclide/coc.nvim", branch = "release" }

    -- Enhancements
    use {"preservim/nerdcommenter"}

    use {'itchyny/lightline.vim'}

    use {"dstein64/nvim-scrollview", branch = 'main' }
    use {'Yggdroot/indentLine'}

    use {"ryanoasis/vim-devicons"}
    use {"nvim-tree/nvim-web-devicons"}
    use {'liuchengxu/vim-clap', run = ':Clap install-binary'}


    use {"preservim/nerdtree"}
    use {"tpope/vim-surround"}

    use {
	   "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {
            map_cr = false
        } end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
         run = ":TSUpdate"
    }
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.x",
        requires = { {'nvim-lua/plenary.nvim'} }
    }

	-- Theme
	use { "ellisonleao/gruvbox.nvim" }


end)


