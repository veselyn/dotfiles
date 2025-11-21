local obsidian = require("obsidian")

obsidian.setup({
	daily_notes = { folder = "0 INBOX" },
	frontmatter = { enabled = false },
	legacy_commands = false,
	ui = { enable = false },
	workspaces = { { path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault" } },
})
