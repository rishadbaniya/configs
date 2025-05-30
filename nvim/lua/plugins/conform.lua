return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			javascript = { { "eslint_d" } },
			typescript = { { "eslint_d" } },
			typescriptreact = { { "eslint_d" } }, -- https://github.com/stevearc/conform.nvim/issues/218#issuecomment-1826438350
			ocaml = { "ocamlformat" },
			--c = { { "clang-format" } },
			--cc = { { "clang-format" } },
			--cpp = { { "clang-format" } },
			--h = { { "clang-format" } },
			xml = { { "xmlformat" } },
			--[[
			   [json = { "jq" },
               ]]
			lua = { "stylua" },
			html = { "htmlbeautifier" },
			["*"] = { "trim_whitespace", "squeeze_blanks", "trim_newlines" },
		},
		format_on_save = function(bufnr)
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") or bufname:match("/vendor/") then
				return
			end
			return { async = true, timeout_ms = 500, lsp_fallback = true }
		end,
		log_level = vim.log.levels.ERROR,
		notify_on_error = true,
		formatters = {
			clang_format = {
				prepend_args = { "--style={ColumnLimit: 0}" },
			},
		},
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
