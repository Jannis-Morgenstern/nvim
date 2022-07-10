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
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
