local M = { mt = {} }

function M.mt.__index(_, server)
	return function(config)
		local success, result = pcall(require, "aul.lsp.configs." .. server)
		if not success then
			return nil
		end

		if type(result) == "function" then
			return result(config)
		end

		return result
	end
end

setmetatable(M, M.mt)

return M
