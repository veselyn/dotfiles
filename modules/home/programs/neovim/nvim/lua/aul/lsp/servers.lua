local configs = require("aul.lsp.configs")

local M = { _servers = {} }

function M:get(server)
	return self._servers[server]
end

function M:set(server, config)
	if type(config) == "function" then
		self._servers[server] = config
	else
		self._servers[server] = function()
			return config
		end
	end
end

function M:del(server)
	self._servers[server] = nil
end

function M:iter()
	local next = pairs(self._servers)

	return function(table, index)
		local server, server_config = next(table, index)

		return server,
			function(config)
				config = config or {}

				local config_global = configs[server](config) or {}
				config = vim.tbl_deep_extend("force", config, config_global)

				local config_local = server_config(config) or {}
				config = vim.tbl_deep_extend("force", config, config_local)

				return config
			end
	end,
		self._servers,
		nil
end

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
	M:set(server)
end

return M
