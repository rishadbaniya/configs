return {
	"dfendr/clipboard-image.nvim",
	config = function()
		require("clipboard-image").setup({
			default = {
				img_dir = "assets",
				img_name = function()
					return os.date("%Y-%m-%d-%H-%M-%S")
				end, -- Example result: "2021-04-13-10-04-18"
				affix = "<\n  %s\n>", -- Multi lines affix
			},

			markdown = {
				img_dir = { "static", "img" }, -- Use table for nested dir (New feature form PR #20)
				img_dir_txt = "/img",
				img_handler = function(img) -- New feature from PR #22
					local script = string.format('./image_compressor.sh "%s"', img.path)
					os.execute(script)
				end,
			},
		})
	end,
}
