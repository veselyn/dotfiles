local set_keymap = vim.api.nvim_set_keymap

local opts = {noremap = true}

set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)

set_keymap('n', '<leader>fr', '<cmd>Telescope lsp_references<CR>', opts)
set_keymap('n', '<leader>fd', '<cmd>Telescope lsp_document_symbols<CR>', opts)
set_keymap('n', '<leader>fw', '<cmd>Telescope lsp_workspace_symbols<CR>', opts)
set_keymap('n', '<leader>fa', '<cmd>Telescope lsp_code_actions<CR>', opts)
