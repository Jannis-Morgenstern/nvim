local null_ls = require("null-ls")
local handlers = require("nyarthan.lsp.handlers")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettierd,
	},
	on_attach = handlers.on_attach,
})
