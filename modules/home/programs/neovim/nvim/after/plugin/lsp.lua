local cmplsp = require("cmp_nvim_lsp")

local augroup = vim.api.nvim_create_augroup("aul.lsp_format", { clear = false })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("aul.lsp_attach", {}),
	callback = function(args)
		vim.api.nvim_clear_autocmds({ event = "BufWritePre", group = augroup, buffer = args.buf })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
})

vim.api.nvim_create_autocmd("LspDetach", {
	group = vim.api.nvim_create_augroup("aul.lsp_detach", {}),
	callback = function(args)
		vim.api.nvim_clear_autocmds({ event = "BufWritePre", group = augroup, buffer = args.buf })
	end,
})

vim.lsp.config("*", { capabilities = cmplsp.default_capabilities() })

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
	"terraformls",
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
vim.keymap.set("n", "grt", vim.lsp.buf.type_definition)

vim.keymap.set("n", "gK", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
