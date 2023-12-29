return {
	"akinsho/flutter-tools.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("telescope").load_extension("flutter")
		vim.keymap.set("n", "<leader>x", "<CMD>Telescope flutter commands<CR>", { noremap = true })
		require("flutter-tools").setup({
			ui = { border = "rounded" },
			decoration = {
				statusline = { device = true, app_version = true },
			},
		})
	end,
}
