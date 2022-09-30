local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup({
  'sumneko_lua',
  'rust_analyzer',
  'tsserver',
})
