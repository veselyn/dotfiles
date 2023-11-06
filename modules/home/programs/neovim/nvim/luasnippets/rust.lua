local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"modtest",
		fmt(
			[[
				#[cfg(test)]
				mod tests {{
					use super::{};

					test{}
				}}
			]],
			{
				i(1, "*"),
				i(2),
			}
		)
	),
}
