-- One would have to install them by opening :Mason
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			javascript = { { "eslint", "prettier" } },
			typescript = { { "eslint" } },
			ocaml = { "ocamlformat" },
			json = { "jq" },
			lua = { "stylua" },
			rust = { "rustfmt" },
			typescriptreact = { { "eslint_d", "eslint" } },
			["*"] = { "trim_whitespace", "squeeze_blanks", "trim_newlines" },
		},
		format_on_save = function(bufnr)
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") or bufname:match("/vendor/") then
				return
			end
			return { async = true, timeout_ms = 500, lsp_fallback = true }
		end,
	},
	config = function(_, opts)
		local cs_fixer = require("conform.formatters.php_cs_fixer")
		cs_fixer.args = function(self, ctx)
			local args = { "fix", "$FILENAME", "--quiet", "--no-interaction", "--using-cache=no" }
			local found = vim.fs.find(".php-cs-fixer.php", { upward = true, path = ctx.dirname })[1]
			if found then
				vim.list_extend(args, { "--config=" .. found })
			else
				vim.list_extend(args, { "--rules=@PSR12,@Symfony" })
			end

			return args
		end

		require("conform").setup(opts)
	end,
}
