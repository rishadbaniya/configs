local set = vim.opt
local cmd = vim.cmd
local global = vim.g

set.background = "dark"
set.rnu = true
set.nu = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.encoding = "UTF-8"
set.errorbells = false

global.mapleader = " "
--By default, indentLine plugin conceals the quotation in the JSON file, i needed that to be turned off
global.vim_json_conceal= 0

cmd([[colorscheme gruvbox]])
cmd([[filetype plugin on]])
