vim.cmd.runtime("colors/dim.vim")

vim.g.colors_name = vim.fn.expand("<sfile>:t:r")

vim.api.nvim_set_hl(0, "SignColumn", {})

vim.api.nvim_set_hl(0, "IblIndent", { link = "LineNr" })
vim.api.nvim_set_hl(0, "IblScope", { link = "Whitespace" })
vim.api.nvim_set_hl(0, "IblWhitespace", { link = "LineNr" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { ctermfg = vim.o.background == "dark" and 15 or 7, fg = "#d65d0e" })
