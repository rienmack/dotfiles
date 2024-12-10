return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = {
    'rafamadriz/friendly-snippets',
    "giuxtaposition/blink-cmp-copilot",
  },

  version = 'v0.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
        },
      },
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer", "copilot" },
      },
    },
    keymap = { preset = 'default' },

    nerd_font_variant = 'mono',

    windows = {
      documentation = {
        auto_show = true,
      },
    },
  },
}
