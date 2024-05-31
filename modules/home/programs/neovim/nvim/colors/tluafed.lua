vim.cmd.runtime("colors/dim.vim")

vim.g.colors_name = vim.fn.expand("<sfile>:t:r")

vim.api.nvim_set_hl(0, "SignColumn", {})
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
