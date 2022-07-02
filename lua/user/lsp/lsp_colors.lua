local lsp_colors = require("lsp-colors")
local colors = require("user.colors")

local asd = 1

lsp_colors.setup({
	Error = colors.diagnostics.error,
	Warning = colors.diagnostics.warning,
	Information = colors.diagnostics.info,
	Hint = colors.diagnostics.hint,
})
