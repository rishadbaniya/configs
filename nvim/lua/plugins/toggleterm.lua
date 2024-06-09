return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			terminal_mappings = true,
			start_in_insert = true,
			auto_scroll = true,
			close_on_exit = true,
			float_opts = {
				border = "curved",
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		--this only works to toggle the terminal on i want to close to using the same key
		--vim.keymap.set("n", "<localleader>t", "<CMD>ToggleTerm<CR>", { noremap = true })
	end,
}
