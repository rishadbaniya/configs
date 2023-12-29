-- LSP Diagnostics Options Setup
--

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })

--vim.highlight.create("ColorColumn", { ctermbg = 0, guibg = lightgrey }, false)

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = false,
	severity_sort = true,
	float = {
		source = "always",
		header = "",
		prefix = "",
	},
})
-- auto run the command whenever we hold the cursor somewhere
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		-- checks if any window is open in the current tab coz we don't interfere
		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
			local config = vim.api.nvim_win_get_config(winid)
			-- the 45 zindex is for the fidget notification, which means
			-- it will continue to show diagnostic even when that fidget notification
			-- is displayed
			if config and config.zindex and config.zindex > 0 and config.zindex ~= 45 then
				return
			end
		end

		-- show the diagnostic if it exists at that line
		vim.diagnostic.open_float({
			focusable = true, -- Enables to interact with the float such as copying the content
			scope = "l", -- Shows diagnostics from that line
		})
	end,
})

-- auto run the command whenever the LspAttach event is fired
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Set When LSP is attached",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>", opts) -- show all diagnostics
		vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})
