local lspconfig = require("lspconfig")

local M = {}

function M.__index(_, key)
	return vim.deepcopy(lspconfig[key].document_config.default_config)
end

return setmetatable({}, M)
