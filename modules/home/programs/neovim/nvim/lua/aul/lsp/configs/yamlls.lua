local schemastore = require("schemastore")

return function()
	return {
		settings = {
			yaml = {
				schemas = schemastore.yaml.schemas(),
			},
		},
	}
end
