local schemastore = require("schemastore")

return function()
	return {
		settings = {
			json = {
				schemas = schemastore.json.schemas(),
			},
		},
	}
end
