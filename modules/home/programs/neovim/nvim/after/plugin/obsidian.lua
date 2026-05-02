local obsidian = require("obsidian")

obsidian.setup({
	daily_notes = { folder = "JOURNAL" },
	frontmatter = { enabled = false },
	legacy_commands = false,
	ui = { enable = false },
	workspaces = { { path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault" } },
})
