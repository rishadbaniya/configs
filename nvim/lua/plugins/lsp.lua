return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim", -- just a plugin for neovim config/plugin dev
	},

	config = function()
		require("neodev").setup({})
		require("lspconfig").eslint.setup({})
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").clangd.setup({})
		require("lspconfig").ocamllsp.setup({})
		require("lspconfig").texlab.setup({})
		require("lspconfig").gopls.setup({})
		--require("lspconfig").perlpls.setup({})
		--settings = {
		--perlnavigator = {
		--perlPath = "perl",
		--enableWarnings = true,
		--perltidyProfile = "",
		--perlcriticProfile = "",
		--perlcriticEnabled = true,
		--},
		--},
		--})
		require("lspconfig").pyright.setup({})
		--setup for single file support
		--require("lspconfig").tsserver.setup({
		--cmd = { "typescript-language-server", "--stdio" },
		--filetypes = {
		--"javascript",
		--"javascriptreact",
		--"javascript.jsx",
		--"typescript",
		--"typescriptreact",
		--"typescript.tsx",
		--},
		--})
		require("lspconfig").dartls.setup({
			cmd = { "dart", "language-server", "--protocol=lsp" },
			filetypes = { "dart" },
			--single_file_support = false,
			root_dir = require("lspconfig/util").root_pattern("pubspec.yaml", ".git"),
		})
	end,
}
