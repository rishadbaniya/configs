return {
    "morhetz/gruvbox",
    config = function()
        local cmd = vim.cmd
        local set = vim.opt
        
        cmd([[colorscheme gruvbox]])
        set.background = "dark"
    end
}


