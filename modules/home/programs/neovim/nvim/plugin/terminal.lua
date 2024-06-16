vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("TermOnOpen", {}),
	callback = function()
		vim.cmd.startinsert()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
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
