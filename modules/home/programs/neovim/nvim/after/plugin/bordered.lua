local cmp = require("cmp")

local open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts)
	opts.border = "rounded"

	local bufnr, winnr = open_floating_preview(contents, syntax, opts)

	vim.wo[winnr].winhighlight = table.concat({
		vim.wo[winnr].winhighlight,
		cmp.config.window.bordered().winhighlight,
		"NormalFloat:Normal",
	}, ",")

	return bufnr, winnr
end
