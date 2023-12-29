return {
	"preservim/nerdtree",
	dependencies = {
		"ryanoasis/vim-devicons",
	},
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<M-1>", ":NERDTreeToggle<CR>", { noremap = true })
	end,
}
