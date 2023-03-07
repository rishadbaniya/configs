-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use { "wbthomason/packer.nvim" }
    -- LSp
	use {"neoclide/coc.nvim", branch = "release" }

    -- Enhancements
    use {"preservim/nerdcommenter"}
    use {"itchyny/lightline.vim"}
    use {"jiangmiao/auto-pairs"}
    use {"dstein64/nvim-scrollview", branch = 'main' }
    use {'Yggdroot/indentLine'}
    use {"ryanoasis/vim-devicons"}
    use {"preservim/nerdtree"}

	-- Theme
	use { "ellisonleao/gruvbox.nvim" }
end)
