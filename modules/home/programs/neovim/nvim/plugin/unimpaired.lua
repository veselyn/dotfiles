local options = {
	{ "m", "winfixheight" },
}

for _, option in ipairs(options) do
	local key, option = unpack(option)

	vim.keymap.set("n", "[o" .. key, function()
		vim.opt_local[option] = true
	end)

	vim.keymap.set("n", "]o" .. key, function()
		vim.opt_local[option] = false
	end)

	vim.keymap.set("n", "yo" .. key, function()
		vim.opt_local[option] = not (vim.opt_local[option]:get())
	end)
end
