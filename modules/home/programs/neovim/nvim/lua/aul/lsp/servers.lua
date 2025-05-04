local configs = require("aul.lsp.configs")

local M = {
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
}

function M:iter()
	local servers = {}

	for _, server in ipairs(self) do
		servers[server] = function(config)
			return vim.tbl_deep_extend("force", config, configs.get(server, config) or {})
		end
	end

	return pairs(servers)
end

return M
