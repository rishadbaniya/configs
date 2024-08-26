return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	opts = {
		provider = "claude",
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-5-sonnet-20240620",
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
			width = 30, -- default % based on available width
			sidebar_header = {
				align = "right",
				rounded = true,
			},
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below is optional, make sure to setup it properly if you have lazy=true
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
