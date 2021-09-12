local autopairs = require('nvim-autopairs')

local cmp = require('nvim-autopairs/completion/cmp')

autopairs.setup()

cmp.setup({map_cr = true, map_complete = true, auto_select = true})
