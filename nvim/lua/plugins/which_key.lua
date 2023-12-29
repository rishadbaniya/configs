local border = {
	line = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
	rectangle = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local which_k = require("which-key")

		which_k.setup({
			window = {
				border = border,
			},
			layout = { align = "center" },
		})

		which_k.register({
			["<leader>"] = {
				f = { name = "Telescope find file" },
				ps = { name = "Telescope grep text and find files" },
				d = { name = "+debug/database", h = "dap hydra" },
				h = { name = "+git-action" },
				n = { name = "+new" },
				j = { name = "+jump" },
				p = { name = "+packages" },
				q = { name = "+quit" },
				l = { name = "+list" },
				i = { name = "+iswap" },
				e = { name = "+edit" },
				r = { name = "+lsp-refactor" },
				o = { name = "+only" },
				t = { name = "+tab" },
				s = { name = "+source/swap" },
				y = { name = "+yank" },
				O = { name = "+options" },
			},
		})
	end,
}
