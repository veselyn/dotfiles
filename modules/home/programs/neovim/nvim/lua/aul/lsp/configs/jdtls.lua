local default = require("aul.lsp.defaults").jdtls

default.cmd[1] = "jdt-language-server"

return {
	cmd = default.cmd,
}
