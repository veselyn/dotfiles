vim.diagnostic.config({
	float = { border = "rounded" },
})

local hover = vim.lsp.buf.hover
function vim.lsp.buf.hover(opts)
	return hover(vim.tbl_extend("force", { border = "rounded" }, opts or {}))
end

local signature_help = vim.lsp.buf.signature_help
function vim.lsp.buf.signature_help(opts)
	return signature_help(vim.tbl_extend("force", { border = "rounded" }, opts or {}))
end
