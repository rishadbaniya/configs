return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/neodev.nvim", -- just a plugin for neovim config/plugin dev
			config = function()
				require("neodev").setup({})
			end,
		},
	},

	config = function()
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").ocamllsp.setup({})
	end,
}
