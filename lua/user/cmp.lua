local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.expand_body(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },  
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-i>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "spell" },
  }),
  formatting = {
    fields = {"kind", "abbr", "menu"},
    format = lspkind.cmp_format({
      mode = "symbol",
      menu = {
        nvim_lsp = "[LSP]",
        luasnip = "[SNIP]",
        buffer = "[BUF]",
        path = "[PATH]",
        spell = "[SPEL]",
      }
    }),
  },
  experimental = {
    ghost_text = true
  }
})
