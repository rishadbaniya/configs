return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		local cmd = vim.cmd
		local set = vim.opt

		cmd([[colorscheme gruvbox]])
		set.background = "dark"
	end,
}
