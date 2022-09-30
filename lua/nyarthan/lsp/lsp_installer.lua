local handlers = require('nyarthan.lsp.handlers')

local servers = {
  'cssls',
  'cssmodules_ls',
  'emmet_ls',
  'html',
  'jsonls',
  'sumneko_lua',
  'tsserver',
  'yamlls',
  'bashls',
  'rust_analyzer',
  'taplo',
  'eslint',
}

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  if server == 'sumneko_lua' then
    local _opts = require('nyarthan.lsp.settings.sumneko_lua')
    opts = vim.tbl_deep_extend('force', _opts, opts)
  end

  lspconfig[server].setup(opts)
end
