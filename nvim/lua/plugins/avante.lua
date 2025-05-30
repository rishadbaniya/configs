return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"zbirenbaum/copilot.lua",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	opts = {
		provider = "claude",
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-7-sonnet-20250219",
			temperature = 0,
			max_tokens = 4096,
		},
		mappings = {
			submit = {
				insert = "<C-CR>",
			},
		},
		windows = {
			wrap = true, -- similar to vim.o.wrap
			width = 40, -- default % based on available width
			sidebar_header = {
				align = "right",
				rounded = true,
			},
		},
	},
}
