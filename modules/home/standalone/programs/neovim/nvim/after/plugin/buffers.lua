local commands = {
	"all",
	"hidden",
	"nameless",
	"other",
	"select",
	"this",
}

for _, command in ipairs(commands) do
	local first_char = command:sub(1, 1)

	vim.keymap.set("n", "<C-Q>" .. first_char, function()
		vim.cmd.Bdelete(command)
	end)

	vim.keymap.set("n", "<C-Q>!" .. first_char, function()
		vim.cmd.Bdelete({ command, bang = true })
	end)
end
