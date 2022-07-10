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
	U.key("n", "gd", vim.lsp.buf.definition, opts)
	U.key("n", "gD", vim.lsp.buf.declaration, opts)
	U.key("n", "K", vim.lsp.buf.hover, opts)
	U.key("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	U.key("n", "gi", vim.lsp.buf.implementation, opts)
	U.key("n", "gf", vim.lsp.buf.format, opts)
	U.key("n", "gR", U.bind(U.nv_cmd, "Trouble lsp_references"), opts)
	U.key("n", "gD", U.bind(U.nv_cmd, "Trouble lsp_definitions"), opts)
	U.key("n", "gT", U.bind(U.nv_cmd, "Trouble lsp_type_definitions"), opts)
	U.key("n", "gr", vim.lsp.buf.rename, opts)
	U.key("n", "gdn", vim.diagnostic.goto_next, opts)
	U.key("n", "gdN", vim.diagnostic.goto_prev, opts)
	U.key("n", "gl", vim.diagnostic.open_float, opts)
	U.key("n", "ga", U.bind(U.nv_cmd, "CodeActionMenu"), opts)
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
