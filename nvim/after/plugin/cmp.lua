local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	completion = {
		autocomplete = false,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-D>"] = cmp.mapping.scroll_docs(1),
		["<C-U>"] = cmp.mapping.scroll_docs(-1),
	}),
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
	}),
})
