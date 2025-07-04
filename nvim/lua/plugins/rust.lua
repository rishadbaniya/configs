return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	ft = { "rust" },
	config = function()
		for _, method in ipairs({ "textDocument/publishDiagnostics", "textDocument/hover", "textDocument/definition" }) do
			local original_handler = vim.lsp.handlers[method]
			vim.lsp.handlers[method] = function(err, result, ctx, config)
				if err and (err.code == -32802 or err.code == -32001) then
					return
				end
				return original_handler(err, result, ctx, config)
			end
		end

		vim.g.rustaceanvim = {
			tools = {
				hover_actions = {
					auto_focus = true,
				},
				inlay_hints = {
					auto = true,
					show_parameter_hints = true,
				},
			},
			server = {
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>ca", function()
						vim.cmd.RustLsp("codeAction")
					end, { buffer = bufnr, desc = "Rust Code Action" })

					vim.keymap.set("n", "<leader>cl", function()
						vim.cmd.RustLsp("codeLens")
					end, { buffer = bufnr, desc = "Rust CodeLens Action" })

					vim.keymap.set("n", "<leader>rd", function()
						vim.cmd.RustLsp("openDocs")
					end, { buffer = bufnr, desc = "Open Rust Docs" })

					vim.keymap.set("n", "<leader>rr", function()
						vim.cmd.RustLsp("runnables")
					end, { buffer = bufnr, desc = "Rust Runnables" })

					vim.keymap.set("n", "<leader>rt", function()
						vim.cmd.RustLsp("testables")
					end, { buffer = bufnr, desc = "Rust Testables" })

					vim.keymap.set("n", "<leader>re", function()
						vim.cmd.RustLsp("expandMacro")
					end, { buffer = bufnr, desc = "Expand Rust Macro" })
				end,
				cmd_env = {
					CARGO_NET_GIT_FETCH_WITH_CLI = "true",
				},
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							disabled = { "unresolved-import" },
							enableExperimental = false,
						},
						checkOnSave = true,
						cargo = {
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
							procMacro = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
							},
						},
						assist = {
							importGranularity = "module",
							importPrefix = "by_self",
						},
						completion = {
							postfix = {
								enable = true,
							},
						},
						interpret = {
							tests = true,
						},
						rustfmt = {
							extraArgs = { "+nightly" },
						},
					},
				},
				standalone = true,
			},
		}
	end,
}
