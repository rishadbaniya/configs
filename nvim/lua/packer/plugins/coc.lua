-- Configurations related to coc.nvim
-- TODO : Add proper documentation at each step
local keymap = vim.keymap;
local fn = vim.fn

local check_b_space = function()
    local col = fn.col('.') - 1
    return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
end

keymap.set("n", "<M-1>", ":NERDTreeToggle<CR>", { noremap = true })

-- Use of <CR> to trigger completion, when COC Options are visible
keymap.set('i', '<CR>', function()
    if fn["coc#pum#visible"]() == 1 then
        return fn["coc#pum#confirm"]()
    else
        return "<CR>"
    end
end, { noremap = true, expr = true })

-- Use of <TAB> to scroll through the provided COC Options
keymap.set("i", "<TAB>", function()
    if fn["coc#pum#visible"]() == 1 then
        return fn["coc#pum#next"](1)
    else
        if check_b_space() == 1 then
            return fn["coc#refresh"]()
        else
            return "<TAB>"
        end
    end
end, { silent = true, noremap = true, expr = true })

-- Use of <SHIFT-TAB> to scroll upward through the provided COC Options
keymap.set("i", "<S-TAB>", function()
    if fn["coc#pum#visible"]() == 1 then
        return fn["coc#pum#prev"](1)
    else
        return "<C-h>"
    end
end, { silent = true, noremap = true, expr = true })

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

local function file_type()
    local current_file = vim.fn.expand('%:e')
    return current_file
end

keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
-- Different GOTO Options
keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })

-- Different Diagnostics Options
keymap.set("n", "<leader>k", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap.set("n", "<leader>j", "<Plug>(coc-diagnostic-next)", { silent = true })
keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true })

keymap.set("n", "<leader>r", function()
    local current_file_type = file_type();
    if current_file_type == "dart" then
        print("ITS DART")
    elseif current_file_type == "rs" then
        print("ITS RUST")
    end
end)
