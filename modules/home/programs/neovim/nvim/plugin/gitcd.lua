local function get_git_root()
	local result = vim.system({ "git", "rev-parse", "--show-toplevel" }):wait()
	assert(result.code == 0)
	assert(result.stdout:len() > 0)
	assert(result.stderr:len() == 0)
	return vim.trim(result.stdout)
end

vim.api.nvim_create_user_command("Cd", function()
	vim.cmd.cd(get_git_root())
end, {})

vim.api.nvim_create_user_command("Lcd", function()
	vim.cmd.lcd(get_git_root())
end, {})

vim.api.nvim_create_user_command("Tcd", function()
	vim.cmd.tcd(get_git_root())
end, {})
