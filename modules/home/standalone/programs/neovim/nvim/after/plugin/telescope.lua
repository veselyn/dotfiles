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

local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, function()
		rhs(themes.get_ivy({ layout_config = { height = 100 } }))
	end, opts)
end

map("n", "<Leader>f#", builtin.grep_string)
map("n", "<Leader>f*", builtin.grep_string)
map("n", "<Leader>fB", builtin.git_branches)
map("n", "<Leader>fC", builtin.git_commits)
map("n", "<Leader>fS", builtin.git_stash)
map("n", "<Leader>fb", builtin.buffers)
map("n", "<Leader>fc", builtin.git_bcommits)
map("n", "<Leader>ff", builtin.find_files)
map("n", "<Leader>fg", builtin.live_grep)
map("n", "<Leader>fh", builtin.help_tags)
map("n", "<Leader>fj", builtin.git_files)
map("n", "<Leader>fp", builtin.pickers)
map("n", "<Leader>fr", builtin.resume)
map("n", "<Leader>fs", builtin.git_status)
map("x", "<Leader>fc", builtin.git_bcommits_range)

local function document_diagnostics(opts)
	builtin.diagnostics(vim.tbl_extend("force", opts, { bufnr = 0 }))
end

local function workspace_diagnostics(opts)
	builtin.diagnostics(vim.tbl_extend("force", opts, { bufnr = nil }))
end

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LspOnAttach" .. vim.fn.expand("<sfile>:t:r"), {}),
	pattern = "LspOnAttach",
	callback = function(args)
		local map = function(mode, lhs, rhs)
			map(mode, lhs, rhs, { buffer = args.data.bufnr })
		end

		map("n", "<LocalLeader>fds", builtin.lsp_document_symbols)
		map("n", "<LocalLeader>fgI", builtin.lsp_implementations)
		map("n", "<LocalLeader>fgR", builtin.lsp_references)
		map("n", "<LocalLeader>fgd", builtin.lsp_definitions)
		map("n", "<LocalLeader>fgo", builtin.lsp_type_definitions)
		map("n", "<LocalLeader>fl", document_diagnostics)
		map("n", "<LocalLeader>fq", workspace_diagnostics)
		map("n", "<LocalLeader>fws", builtin.lsp_dynamic_workspace_symbols)
	end,
})
