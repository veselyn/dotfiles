local cmplsp = require("cmp_nvim_lsp")

local capabilities = cmplsp.default_capabilities()

local function on_attach(_, bufnr)
	vim.api.nvim_exec_autocmds("User", { pattern = "LspOnAttach", data = { bufnr = bufnr } })
end

vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = on_attach,
})

for _, server in ipairs({
	"bashls",
	"clangd",
	"cssls",
	"elixirls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"nil_ls",
	"pyright",
	"rust_analyzer",
	"sourcekit",
	"texlab",
	"ts_ls",
	"yamlls",
}) do
	vim.lsp.enable(server)
end

vim.keymap.set("n", "gP", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "gQ", vim.lsp.buf.format)
vim.keymap.set("n", "grD", vim.lsp.buf.declaration)
vim.keymap.set("n", "grd", vim.lsp.buf.definition)
vim.keymap.set("n", "grl", vim.diagnostic.setloclist)
vim.keymap.set("n", "grq", vim.diagnostic.setqflist)
vim.keymap.set("n", "grt", vim.lsp.buf.type_definition)
