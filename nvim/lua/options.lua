local set = vim.opt
local cmd = vim.cmd

set.background = "dark"
set.rnu = true
set.nu = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.encoding = "UTF-8"
set.errorbells = false

vim.g.indentLine_char = '|'

cmd([[colorscheme gruvbox]])
cmd([[filetype plugin on]])
