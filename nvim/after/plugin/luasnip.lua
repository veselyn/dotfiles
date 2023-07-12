local from_lua = require("luasnip.loaders.from_lua")
local from_snipmate = require("luasnip.loaders.from_snipmate")
local from_vscode = require("luasnip.loaders.from_vscode")
local luasnip = require("luasnip")

from_lua.lazy_load()
from_snipmate.lazy_load()
from_vscode.lazy_load()

vim.keymap.set("i", "<C-Y>", function()
	if luasnip.expandable() then
		luasnip.expand()
	end
end)

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice()
	end
end)

vim.keymap.set({ "i", "s" }, "<C-F>", function()
	if luasnip.jumpable(1) then
		luasnip.jump(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<C-B>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end)
