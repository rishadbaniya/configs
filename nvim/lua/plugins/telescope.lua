return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap
		local fn = vim.fn
		local builtin = require("telescope.builtin")

		keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { noremap = true })
		keymap.set("n", "<leader>pf", "<cmd>Telescope git_files<CR>", { noremap = true })
		keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = fn.input("Grep > ") })
		end, { noremap = true })

		keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { noremap = true })

		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					width = 0.9,
					height = 0.9,
					preview_cutoff = 1,
					prompt_position = "bottom",
				},
			},
		})
	end,
}
