vim.keymap.set("n", "<Leader>ne", function()
	vim.cmd.EditVifm()
end)

vim.keymap.set("n", "<Leader>ns", function()
	vim.cmd.SplitVifm()
end)

vim.keymap.set("n", "<Leader>nt", function()
	vim.cmd.TabVifm()
end)

vim.keymap.set("n", "<Leader>nv", function()
	vim.cmd.VsplitVifm()
end)
