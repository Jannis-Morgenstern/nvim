local icons = require("nyarthan.icons")

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.info },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			active = true,
		},
		update_in_insert = true,
	})
end

local function lsp_keymaps(bufnr)
	local opts = { buffer = bufnr }
	local key = U.make_key(opts)

	key("n", "gd", vim.lsp.buf.definition)
	key("n", "gD", vim.lsp.buf.declaration)
	key("n", "K", vim.lsp.buf.hover)
	key("n", "<C-k>", vim.lsp.buf.signature_help)
	key("n", "gi", vim.lsp.buf.implementation)
	key("n", "gf", vim.lsp.buf.format)
	key("n", "gR", U.make_cmd("Trouble lsp_references"))
	key("n", "gD", U.make_cmd("Trouble lsp_definitions"))
	key("n", "gT", U.make_cmd("Trouble lsp_type_definitions"))
	key("n", "gr", vim.lsp.buf.rename)
	key("n", "gdn", vim.diagnostic.goto_next)
	key("n", "gdN", vim.diagnostic.goto_prev)
	key("n", "gl", vim.diagnostic.open_float)
	key("n", "ga", U.make_cmd("CodeActionMenu"))
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	-- signature.on_attach({
	-- 	bind = true,
	-- 	handler_opts = {
	-- 		border = "rounded",
	-- 	},
	-- }, bufnr)

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

return M
