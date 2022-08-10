require("dressing").setup({
	input = {
		enabled = true,
		insert_ony = false,
		anchor = "NW",
		mappings = {
			i = {
				["<c-i>"] = "Confirm",
				["<cr>"] = U.noop,
				["<c-c>"] = "Close",
			},
		},
	},
})
