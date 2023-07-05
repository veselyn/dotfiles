vim.keymap.set("n", "<Leader>l", function()
	for _, value in ipairs(vim.fn.getwininfo()) do
		if value.loclist == 1 then
			vim.cmd.lclose()
			return
		end
	end
	local success, result = pcall(vim.cmd.lopen)
	if not success then
		vim.notify(result:sub(#"Vim:" + 1), vim.log.levels.ERROR)
	end
end)

vim.keymap.set("n", "<Leader>q", function()
	for _, value in ipairs(vim.fn.getwininfo()) do
		if value.quickfix == 1 then
			vim.cmd.cclose()
			return
		end
	end
	vim.cmd.copen()
end)
