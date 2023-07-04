local from_lua = require("luasnip.loaders.from_lua")
local from_snipmate = require("luasnip.loaders.from_snipmate")
local from_vscode = require("luasnip.loaders.from_vscode")

from_lua.lazy_load()
from_snipmate.lazy_load()
from_vscode.lazy_load()
