local cmplsp = require("cmp_nvim_lsp")

local augroup = vim.api.nvim_create_augroup("LspFormat" .. vim.fn.expand("<sfile>:t:r"), { clear = false })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspAttach" .. vim.fn.expand("<sfile>:t:r"), {}),
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
	group = vim.api.nvim_create_augroup("LspDetach" .. vim.fn.expand("<sfile>:t:r"), {}),
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
