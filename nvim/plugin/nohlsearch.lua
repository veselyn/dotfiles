vim.keymap.set("n", "<Esc>", function()
	vim.cmd.nohlsearch()
	vim.cmd.diffupdate()
end)
