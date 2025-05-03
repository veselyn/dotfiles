local M = {}

function M.get(server, config)
	local success, result = pcall(require, "aul.lsp.configs." .. server)
	if not success then
		return nil
	end

	return result(config)
end

return M
