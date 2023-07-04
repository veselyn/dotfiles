local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	completion = {
		autocomplete = false,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-D>"] = cmp.mapping.scroll_docs(1),
		["<C-U>"] = cmp.mapping.scroll_docs(-1),
	}),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}),
})
