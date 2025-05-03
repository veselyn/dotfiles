local lspconfig = require("lspconfig")

return setmetatable({}, {
	__index = function(_, key)
		return vim.deepcopy(lspconfig[key].document_config.default_config)
	end,
})
