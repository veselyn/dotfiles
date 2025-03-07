local indentline = require("ibl")
local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "IblIndent", { link = "LineNr" })
	vim.api.nvim_set_hl(0, "IblWhitespace", { link = "LineNr" })
	vim.api.nvim_set_hl(0, "IblScope", { link = "Whitespace" })
end)

local char = "▏"

indentline.setup({
	indent = { char = char, tab_char = char },
})
