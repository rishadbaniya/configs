local opts = { noremap = true, silent = true }
return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	version = "^1.0.0",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {},
	config = function()
		require("barbar").setup()
		-- move to the left and right tabs
		vim.api.nvim_set_keymap("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opts)
		vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>BufferNext<CR>", opts)
	end,
}
