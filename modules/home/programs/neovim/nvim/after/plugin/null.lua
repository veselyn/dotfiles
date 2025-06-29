local null = require("null-ls")

local treefmt = null.builtins.formatting.treefmt.with({
	condition = function()
		return true
	end,
})

null.setup({ sources = { treefmt } })
