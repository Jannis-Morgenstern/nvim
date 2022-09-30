local lsp_colors = require('lsp-colors')
local colors = require('nyarthan.colors')

lsp_colors.setup({
  Error = colors.diagnostics.error,
  Warning = colors.diagnostics.warning,
  Information = colors.diagnostics.info,
  Hint = colors.diagnostics.hint,
})
