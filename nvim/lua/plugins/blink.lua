return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = {
    'rafamadriz/friendly-snippets',
    "giuxtaposition/blink-cmp-copilot",
  },
  version = '*',
  completion = {
    keyword = { range = 'full' },
    menu = { border = 'single' },
    documentation = { window = { border = 'single' } },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true
        },
      },
    },
  },
  documentation = { auto_show = true },
}
