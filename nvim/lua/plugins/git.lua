return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
	},
	cmd = "Neogit",
	keys = {
		{
			"<localleader>gs",
			function()
				require("neogit").open()
			end,
			desc = "Show Status",
		},
		{
			"<localleader>gc",
			function()
				require("neogit").open({ "commit" })
			end,
			desc = "Show Commit",
		},
		{
			"<localleader>gl",
			function()
				require("neogit").popups.pull.create()
			end,
			desc = "Pull Popup",
		},
		{
			"<localleader>gp",
			function()
				require("neogit").popups.push.create()
			end,
			desc = "Push Popup",
		},
	},
	opts = {
		disable_signs = false,
		disable_hint = true,
		disable_commit_confirmation = true,
		disable_builtin_notifications = true,
		disable_insert_on_commit = false,
		signs = {
			section = { "", "󰘕" }, -- "󰁙", "󰁊"
			item = { "▸", "▾" },
			hunk = { "󰐕", "󰍴" },
		},
		integrations = {
			diffview = true,
		},
	},
	config = true,
}
