--nnoremap <leader>ff <cmd>Telescope find_files<cr>
--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>
local keymap = vim.keymap;
local builtin = require('telescope.builtin')

--keymap.set("n", "<M-1>", ":NERDTreeToggle<CR>",{ noremap = true })
keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", {noremap = true})
keymap.set("n", "<leader>pf", "<cmd>Telescope git_files<CR>", {noremap = true})
keymap.set("n", "<leader>ps", function()
    builtin.grep_string({search = vim.fn.input("Grep > ")})
end, {noremap = true})



