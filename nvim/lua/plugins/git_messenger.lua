return {
	"rhysd/git-messenger.vim",
	keys = {
		{
			"<leader>gg",
			function()
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					local buf = vim.api.nvim_win_get_buf(win)
					if vim.bo[buf].filetype == "gitmessengerpopup" then
						vim.cmd("GitMessengerClose")
						return
					end
				end
				vim.cmd("GitMessenger")
			end,
			desc = "Git Messenger: toggle popup",
		},
	},
	init = function()
		vim.g.git_messenger_no_default_mappings = true
		vim.g.git_messenger_always_into_popup = true
		vim.g.git_messenger_floating_win_opts = { border = "rounded" }
	end,
}
