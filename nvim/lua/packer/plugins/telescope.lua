--nnoremap <leader>ff <cmd>Telescope find_files<cr>
--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>
local keymap = vim.keymap;

--keymap.set("n", "<M-1>", ":NERDTreeToggle<CR>",{ noremap = true })
keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", {noremap = true})
