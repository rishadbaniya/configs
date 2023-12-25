return { 
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        build = ":Copilot auth",
        config = function()
            opts = {
                suggestion = { enabled = false },
                panel = { enabled = false },
                filetypes = {
                    gitcommit = true,
                    yaml = true,
                    gitrebase = true,
                    hgcommit = false,
	        	    help = false,
	        	    svn = false,
	        	    conf = false,
                    rust = true,
	        	    ["."] = false,
                }
            }
            require("copilot").setup(opts)
        end
    },

    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
          require("copilot_cmp").setup()
        end
    }
}
