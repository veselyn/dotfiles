local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	on_attach = function(_, bufnr)
		local function map(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
		end

		map("n", "<LocalLeader>K", vim.lsp.buf.signature_help)
		map("n", "<LocalLeader>[d", vim.diagnostic.goto_prev)
		map("n", "<LocalLeader>]d", vim.diagnostic.goto_next)
		map("n", "<LocalLeader>e", vim.diagnostic.open_float)
		map("n", "<LocalLeader>f", function() vim.lsp.buf.format({ async = true }) end)
		map("n", "<LocalLeader>gD", vim.lsp.buf.declaration)
		map("n", "<LocalLeader>gd", vim.lsp.buf.definition)
		map("n", "<LocalLeader>gi", vim.lsp.buf.implementation)
		map("n", "<LocalLeader>go", vim.lsp.buf.type_definition)
		map("n", "<LocalLeader>gr", vim.lsp.buf.references)
		map("n", "<LocalLeader>k", vim.lsp.buf.hover)
		map("n", "<LocalLeader>q", vim.diagnostic.setloclist)
		map("n", "<LocalLeader>rn", vim.lsp.buf.rename)
		map("n", "<LocalLeader>wa", vim.lsp.buf.add_workspace_folder)
		map("n", "<LocalLeader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
		map("n", "<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder)
		map({ "n", "x" }, "<LocalLeader>ca", vim.lsp.buf.code_action)
	end,
})
