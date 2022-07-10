local trouble = require("trouble")
local icons = require("nyarthan.icons")

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

local opts = { silent = true, noremap = true }
U.key("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
U.key("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
U.key("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
U.key("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
