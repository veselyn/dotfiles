local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

telescope.setup({
	defaults = {
		cache_picker = {
			num_pickers = 10,
		},
	},
})

telescope.load_extension("fzf")

local function man_pages(opts)
	builtin.man_pages(vim.tbl_extend("force", opts or {}, { sections = { "ALL" } }))
end

vim.keymap.set("n", "<Leader>f#", builtin.grep_string)
vim.keymap.set("n", "<Leader>f*", builtin.grep_string)
vim.keymap.set("n", "<Leader>fB", builtin.git_branches)
vim.keymap.set("n", "<Leader>fC", builtin.git_commits)
vim.keymap.set("n", "<Leader>fM", man_pages)
vim.keymap.set("n", "<Leader>fS", builtin.git_stash)
vim.keymap.set("n", "<Leader>fb", builtin.buffers)
vim.keymap.set("n", "<Leader>fc", builtin.git_bcommits)
vim.keymap.set("n", "<Leader>fe", builtin.registers)
vim.keymap.set("n", "<Leader>ff", builtin.find_files)
vim.keymap.set("n", "<Leader>fg", builtin.live_grep)
vim.keymap.set("n", "<Leader>fh", builtin.help_tags)
vim.keymap.set("n", "<Leader>fj", builtin.git_files)
vim.keymap.set("n", "<Leader>fm", builtin.marks)
vim.keymap.set("n", "<Leader>fp", builtin.pickers)
vim.keymap.set("n", "<Leader>fr", builtin.resume)
vim.keymap.set("n", "<Leader>fs", builtin.git_status)
vim.keymap.set("x", "<Leader>fc", builtin.git_bcommits_range)

local function document_diagnostics(opts)
	builtin.diagnostics(vim.tbl_extend("force", opts or {}, { bufnr = 0 }))
end

local function workspace_diagnostics(opts)
	builtin.diagnostics(vim.tbl_extend("force", opts or {}, { bufnr = nil }))
end

vim.keymap.set("n", "<Leader>gO", builtin.lsp_document_symbols)
vim.keymap.set("n", "<Leader>gP", builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<Leader>go", builtin.lsp_document_symbols)
vim.keymap.set("n", "<Leader>gp", builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<Leader>grd", builtin.lsp_definitions)
vim.keymap.set("n", "<Leader>gri", builtin.lsp_implementations)
vim.keymap.set("n", "<Leader>grl", document_diagnostics)
vim.keymap.set("n", "<Leader>grq", workspace_diagnostics)
vim.keymap.set("n", "<Leader>grr", builtin.lsp_references)
vim.keymap.set("n", "<Leader>grt", builtin.lsp_type_definitions)
