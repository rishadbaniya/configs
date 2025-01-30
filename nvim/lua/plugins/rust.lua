return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	ft = { "rust" },
	config = function() end,
	opts = {
		server = {
			on_attach = function(_, bufnr)
				--vim.keymap.set("n", "<leader>ca", function()
				--vim.cmd.RustLsp("codeAction")
				--end, { buffer = bufnr, desc = "Code Action" })
				--vim.keymap.set("n", "<leader>cl", function()
				--vim.cmd.RustLsp("codeLens")
				--end, { buffer = bufnr, desc = "CodeLens Action" })
			end,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
						extraArgs = { "--", "-W", "warnings" },
					},
					assist = {
						importGranularity = "module",
						importPrefix = "by_self",
					},
					cargo = {
						loadOutDirsFromCheck = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
		},
	},
}
