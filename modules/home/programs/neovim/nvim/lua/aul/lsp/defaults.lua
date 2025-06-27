local lspconfig = require("lspconfig")

local M = { mt = {} }

function M.mt.__index(_, server)
	return vim.deepcopy(lspconfig[server].document_config.default_config)
end

setmetatable(M, M.mt)

return M
