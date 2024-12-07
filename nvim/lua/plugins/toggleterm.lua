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

		local Terminal = require("toggleterm.terminal").Terminal
		local float_term = Terminal:new({ direction = "float" })

		function _TOGGLE_FLOAT_TERM()
			if float_term:is_open() then
				float_term:close()
			else
				float_term:open()
			end
		end

		vim.keymap.set({ "n", "t" }, "<leader>tt", "<CMD>lua _TOGGLE_FLOAT_TERM()<CR>", { noremap = true })
	end,
}
