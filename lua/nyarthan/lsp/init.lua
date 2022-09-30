require('nyarthan.lsp.mason')
require('nyarthan.lsp.lsp_installer')
require('nyarthan.lsp.lsp_colors')
require('nyarthan.lsp.lsp_signature')
require('nyarthan.lsp.fidget')
require('nyarthan.lsp.rust-tools')
require('nyarthan.lsp.lightbulb')
require('nyarthan.lsp.null-ls')

local lspconfig = require('lspconfig')

local handlers = require('nyarthan.lsp.handlers')

handlers.setup()
