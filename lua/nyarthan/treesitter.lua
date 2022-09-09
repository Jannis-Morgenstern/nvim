local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
	auto_install = true,
	ensure_installed = {
		"gitignore",
		"java",
		"javascript",
		"json",
		"lua",
		"proto",
		"rust",
		"teal",
		"tsx",
		"typescript",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = false,
	},
	context = { enable = true },
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"xml",
			"javascriptreact",
			"typescriptreact",
			"jsx",
			"tsx",
			"svelte",
			"markdown",
		},
	},
})
