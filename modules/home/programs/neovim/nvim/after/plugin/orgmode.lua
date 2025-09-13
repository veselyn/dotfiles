local orgmode = require("orgmode")

local org_dir = "~/org"

orgmode.setup({
	org_agenda_files = org_dir .. "/**/*",
	org_default_notes_file = org_dir .. "/refile.org",
})
