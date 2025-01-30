local set = vim.opt
local cmd = vim.cmd
local global = vim.g

set.termguicolors = true
set.rnu = true
set.nu = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.encoding = "UTF-8"
set.errorbells = false
set.clipboard = "unnamedplus"
set.scrolloff = 8
set.wrap = false
set.ignorecase = true
set.updatetime = 250
set.cursorline = true
set.colorcolumn = "180"
set.conceallevel = 3
global.webdevicons_conceal_nerdtree_brackets = 1
global.mapleader = " "
global.maplocalleader = ","

--local fold_column = vim.fn["foldcolumn"]();
--print(fold_column + 10)
--set.foldcolumn = "4"
set.foldenable = false
--By default, indentLine plugin conceals the quotation in the JSON file, i needed that to be turned off

global.vim_json_conceal = 0

cmd("filetype plugin on")
cmd("set signcolumn=yes") -- shows that diagnostic signs at the left of the numbers

-- gray
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- blue
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
-- light blue
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
-- pink
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- front
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
