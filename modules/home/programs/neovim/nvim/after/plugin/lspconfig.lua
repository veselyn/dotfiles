local lspconfig = require("lspconfig")
local cmplsp = require("cmp_nvim_lsp")
local servers = require("aul.lsp.servers")

local function format()
	vim.lsp.buf.format({ async = true })
end

local function list_workspace_folders()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

local function toggle_inlay_hint()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

local function on_attach(_, bufnr)
	local function map(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
	end

	map("n", "<LocalLeader>ds", vim.lsp.buf.document_symbol)
	map("n", "<LocalLeader>f", format)
	map("n", "<LocalLeader>h", toggle_inlay_hint)
	map("n", "<LocalLeader>k", vim.lsp.buf.signature_help)
	map("n", "<LocalLeader>l", vim.diagnostic.setloclist)
	map("n", "<LocalLeader>q", vim.diagnostic.setqflist)
	map("n", "<LocalLeader>rn", vim.lsp.buf.rename)
	map("n", "<LocalLeader>wa", vim.lsp.buf.add_workspace_folder)
	map("n", "<LocalLeader>wl", list_workspace_folders)
	map("n", "<LocalLeader>wr", vim.lsp.buf.remove_workspace_folder)
	map("n", "<LocalLeader>ws", vim.lsp.buf.workspace_symbol)
	map("n", "K", vim.lsp.buf.hover)
	map("n", "[d", vim.diagnostic.goto_prev)
	map("n", "]d", vim.diagnostic.goto_next)
	map("n", "gD", vim.lsp.buf.declaration)
	map("n", "gI", vim.lsp.buf.implementation)
	map("n", "gR", vim.lsp.buf.references)
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gl", vim.diagnostic.open_float)
	map("n", "go", vim.lsp.buf.type_definition)
	map({ "n", "x" }, "<LocalLeader>ca", vim.lsp.buf.code_action)

	vim.api.nvim_exec_autocmds("User", { pattern = "LspOnAttach", data = { bufnr = bufnr } })
end

for server, config in servers:iter() do
	lspconfig[server].setup(config({
		capabilities = cmplsp.default_capabilities(),
		on_attach = on_attach,
	}))
end
