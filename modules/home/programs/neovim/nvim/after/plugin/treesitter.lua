local treesitter = require("nvim-treesitter")

treesitter.setup()

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
