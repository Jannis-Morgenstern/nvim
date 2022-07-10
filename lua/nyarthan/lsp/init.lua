require("nyarthan.lsp.lsp_installer")
require("nyarthan.lsp.null_ls")
require("nyarthan.lsp.lsp_colors")
require("nyarthan.lsp.lsp_signature")

local handlers = require("nyarthan.lsp.handlers")

handlers.setup()
