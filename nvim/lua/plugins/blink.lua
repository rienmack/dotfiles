local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
local winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None"
return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = {
    'rafamadriz/friendly-snippets',
    "giuxtaposition/blink-cmp-copilot",
    { "onsails/lspkind.nvim" },
    { "echasnovski/mini.icons", version = false },
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
    completion = {
      keyword = { range = "full" },
      menu = {
        -- Don't automatically show the completion menu
        auto_show = true,
        -- border = border,
        winhighlight = winhighlight,
        draw = {
          columns = {
            { "kind_icon", "kind",              gap = 2 },
            { "label",     "label_description", "source_name", gap = 1 },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local miniIcons = require("mini.icons")
                if ctx.kind == "Folder" then
                  return miniIcons.get("directory", ctx.label)
                end
                if ctx.kind == "File" then
                  return miniIcons.get("file", ctx.label)
                end
                if ctx.kind == "Copilot" then
                  return ""
                end
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- Optionally, you may also use the highlights from mini.icons
              highlight = function(ctx)
                if ctx.kind == "Folder" then
                  local _, hl, _ = require("mini.icons").get("directory", ctx.label)
                  return hl
                end
                if ctx.kind == "File" then
                  local _, hl, _ = require("mini.icons").get("file", ctx.label)
                  return hl
                end
                if ctx.kind == "Copilot" then
                  local _, hl, _ = require("mini.icons").get("os", "nixos")
                  return hl
                end
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              text = function(ctx)
                return " " .. ctx.kind
              end,
            },
          },
        },
      },
      documentation = {
        window = {
          border = border,
          winhighlight = winhighlight,
        },
        -- window = { border = "single" },
        auto_show = true,
        auto_show_delay_ms = 500,
      },

      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = false },

      trigger = {
        show_on_keyword = true,
      },
    },
  }
}
