local from_lua = require("luasnip.loaders.from_lua")
local from_snipmate = require("luasnip.loaders.from_snipmate")
local from_vscode = require("luasnip.loaders.from_vscode")
local luasnip = require("luasnip")

from_lua.lazy_load()
from_snipmate.lazy_load()
from_vscode.lazy_load()

vim.keymap.set("i", "<C-Y>", luasnip.expand)
vim.keymap.set({ "i", "s" }, "<C-E>", luasnip.change_choice)

vim.keymap.set({ "i", "s" }, "<C-F>", function()
	luasnip.jump(1)
end)

vim.keymap.set({ "i", "s" }, "<C-B>", function()
	luasnip.jump(-1)
end)
