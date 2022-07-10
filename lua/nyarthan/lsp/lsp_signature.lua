local signature = require("lsp_signature")

signature.setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
	hint_enable = false,
})
