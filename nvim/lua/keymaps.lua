local keymap = vim.keymap;
local fn = vim.fn

function check_b_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

keymap.set("n", "<M-1>", ":NERDTreeToggle<CR>",{ noremap = true })

-- Use of <CR> to trigger completion, when COC Options are visible
keymap.set('i', '<CR>', function()
    if fn["coc#pum#visible"]() == 1 then
        return fn["coc#pum#confirm"]()
    else
        return "<CR>"
    end
end, { noremap = true, expr = true})

-- Use of <TAB> to scroll through the provided COC Options
keymap.set("i", "<TAB>", function()
    if fn["coc#pum#visible"]() == 1 then
        return fn["coc#pum#next"](1)
    else
        if check_b_space() == 1 then
            return "<TAB>"
        else
            return fn["coc#refresh"]()
        end
    end
end, {silent = true, noremap = true, expr = true})

-- Use of <SHIFT-TAB> to scroll upward through the provided COC Options
keymap.set("i", "<S-TAB>", function()
    if fn["coc#pum#visible"]() == 1 then
        return fn["coc#pum#prev"](1)
    else
        return "<C-h>"
    end
end, {silent = true, noremap = true, expr = true})

--keymap.set("n", "gn" ,"<Plug>coc-diagnostics-next")
--keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
---- Toggle CocDiagnostics i.e list all errors/warnings thrown by LSP
--local toggle_coc_diagnostics = function()
   --local is_enabled = fn["Coca"]
--end

