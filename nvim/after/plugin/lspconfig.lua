local lspconfig = require("lspconfig")

local function format()
	vim.lsp.buf.format({ async = true })
end

local function list_workspace_folders()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local function on_attach(_, bufnr)
	local function map(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
	end

	map("n", "<LocalLeader>K", vim.lsp.buf.signature_help)
	map("n", "<LocalLeader>[d", vim.diagnostic.goto_prev)
	map("n", "<LocalLeader>]d", vim.diagnostic.goto_next)
	map("n", "<LocalLeader>e", vim.diagnostic.open_float)
	map("n", "<LocalLeader>f", format)
	map("n", "<LocalLeader>gD", vim.lsp.buf.declaration)
	map("n", "<LocalLeader>gd", vim.lsp.buf.definition)
	map("n", "<LocalLeader>gi", vim.lsp.buf.implementation)
	map("n", "<LocalLeader>gr", vim.lsp.buf.references)
	map("n", "<LocalLeader>gt", vim.lsp.buf.type_definition)
	map("n", "<LocalLeader>k", vim.lsp.buf.hover)
	map("n", "<LocalLeader>l", vim.diagnostic.setloclist)
	map("n", "<LocalLeader>q", vim.diagnostic.setqflist)
	map("n", "<LocalLeader>rn", vim.lsp.buf.rename)
	map("n", "<LocalLeader>wa", vim.lsp.buf.add_workspace_folder)
	map("n", "<LocalLeader>wl", list_workspace_folders)
	map("n", "<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder)
	map({ "n", "x" }, "<LocalLeader>ca", vim.lsp.buf.code_action)

	local augroup = vim.api.nvim_create_augroup("LspFormat", { clear = false })
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})
end

local servers = {
	"bashls",
	"gopls",
	"lua_ls",
	"rust_analyzer",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
	})
end
