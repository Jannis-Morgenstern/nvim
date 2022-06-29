local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.shfmt.with({
			extra_args = { "-i", "2", "-sr", "-s", "-ci" },
		}),
		formatting.rustfmt,
		diagnostics.shellcheck,
		code_actions.shellcheck,
	},
	on_attach = function(client)
		-- if client.server_capabilities.document_formatting then
		-- 	vim.cmd([[
  --       augroup LspFormatting
  --         autocmd! * <buffer>
  --         autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })
  --       augroup END
  --     ]])
		-- end
	end,
})
