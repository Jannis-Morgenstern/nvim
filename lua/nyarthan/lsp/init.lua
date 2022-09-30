require('nyarthan.lsp.mason')
-- require('nyarthan.lsp.lsp-format')
require('nyarthan.lsp.lsp_installer')
require('nyarthan.lsp.lsp_colors')
require('nyarthan.lsp.lsp_signature')
require('nyarthan.lsp.fidget')
require('nyarthan.lsp.rust-tools')
require('nyarthan.lsp.lightbulb')
require("nyarthan.lsp.null-ls")

local lspconfig = require('lspconfig')

local handlers = require('nyarthan.lsp.handlers')
--
-- local prettier = {
--   formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
--   formatStdin = true,
-- }
--
-- require('lsp-format').setup({})
--
-- lspconfig.efm.setup({
--   on_attach = require('lsp-format').on_attach,
--   init_options = { documentFormatting = true },
--   settings = {
--     rootMarkers = { '.git/' },
--     languages = {
--       typescript = { prettier },
--       lua = {
--         { formatCommand = 'stylua .' },
--       },
--     },
--   },
-- })

handlers.setup()
