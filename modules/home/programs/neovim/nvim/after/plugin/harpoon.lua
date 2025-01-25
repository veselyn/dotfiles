local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<Leader>a", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<Leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {
		border = "rounded",
		height_in_lines = 10,
		title = "Favorites",
		title_pos = "center",
		ui_width_ratio = 0.5,
	})
end)

for i = 1, 10 do
	vim.keymap.set("n", "<Leader>" .. i % 10, function()
		harpoon:list():select(i % 10)
	end)
end

vim.keymap.set("n", "[h", function()
	harpoon:list():prev()
end)

vim.keymap.set("n", "]h", function()
	harpoon:list():next()
end)
