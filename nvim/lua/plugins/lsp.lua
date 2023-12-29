return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim", -- just a plugin for neovim config/plugin dev
	},

	config = function()
		require("neodev").setup({})
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").ocamllsp.setup({})
		require("lspconfig").dartls.setup({
			cmd = { "dart", "language-server", "--protocol=lsp" },
			filetypes = { "dart" },
			--single_file_support = false,
			root_dir = require("lspconfig/util").root_pattern("pubspec.yaml", ".git"),
		})
	end,
}
