local lspconfig = require("lspconfig")
local cmplsp = require("cmp_nvim_lsp")
local servers = require("aul.lsp.servers")

local capabilities = cmplsp.default_capabilities()

local function on_attach(_, bufnr)
	vim.api.nvim_exec_autocmds("User", { pattern = "LspOnAttach", data = { bufnr = bufnr } })
end

for server, config in servers:iter() do
	lspconfig[server].setup(config({
		capabilities = capabilities,
		on_attach = on_attach,
	}))
end

vim.keymap.set("n", "gP", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "gQ", vim.lsp.buf.format)
vim.keymap.set("n", "grD", vim.lsp.buf.declaration)
vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "grl", vim.diagnostic.setloclist)
vim.keymap.set("n", "grq", vim.diagnostic.setqflist)
vim.keymap.set("n", "grt", vim.lsp.buf.type_definition)
