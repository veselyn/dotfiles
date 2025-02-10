local function setup()
	vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", {
		ctermfg = vim.o.background == "dark" and 15 or 7,
		fg = "#d65d0e",
	})
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("RainbowDelimiters", {}),
	callback = setup,
})

setup()
