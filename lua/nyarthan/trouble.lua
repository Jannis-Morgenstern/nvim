local trouble = require("trouble")
local icons = require("nyarthan.icons")
local keymaps = require("nyarthan.keymaps")

trouble.setup({
	signs = {
		error = icons.diagnostics.error,
		warning = icons.diagnostics.warning,
		hint = icons.diagnostics.hint,
		information = icons.diagnostics.info,
		other = icons.diagnostics.question,
	},
	auto_close = true,
	auto_preview = true,
})

keymaps.set_keys.trouble()
