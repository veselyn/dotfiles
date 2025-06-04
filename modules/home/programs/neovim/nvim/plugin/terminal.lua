vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("TermOnOpen", {}),
	callback = function()
		vim.cmd.startinsert()
	end,
})

vim.keymap.set("n", "<Leader>te", function()
	vim.cmd.edit("term://$SHELL")
end)

vim.keymap.set("n", "<Leader>ts", function()
	vim.cmd.split("term://$SHELL")
end)

vim.keymap.set("n", "<Leader>tt", function()
	vim.cmd.tabedit("term://$SHELL")
end)

vim.keymap.set("n", "<Leader>tv", function()
	vim.cmd.vsplit("term://$SHELL")
end)
