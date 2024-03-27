return {
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
			files = {
				excludeDirs = {
					".devenv/",
					".direnv/",
				},
			},
		},
	},
}
