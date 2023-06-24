local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		cache_picker = {
			num_pickers = 10,
		},
	},
})

vim.keymap.set("n", "<Leader>f#", builtin.grep_string)
vim.keymap.set("n", "<Leader>f*", builtin.grep_string)
vim.keymap.set("n", "<Leader>fb", builtin.buffers)
vim.keymap.set("n", "<Leader>ff", builtin.find_files)
vim.keymap.set("n", "<Leader>fg", builtin.live_grep)
vim.keymap.set("n", "<Leader>fh", builtin.help_tags)
vim.keymap.set("n", "<Leader>fj", builtin.git_files)
vim.keymap.set("n", "<Leader>fp", builtin.pickers)
vim.keymap.set("n", "<Leader>fr", builtin.resume)
