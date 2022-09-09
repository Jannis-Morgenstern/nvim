return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					[vim.fn.stdpath("data") .. "/site/pack/packer/start"] = true,
					[os.getenv("HOME") .. "/dev/private/nvim-plugins"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
