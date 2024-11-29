return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, vue = true, javascript = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      php = { 'php-cs-fixer' },
      json = { 'fixjson', 'pint' },
      go = { 'gofmt', 'goimports' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
    },
    formatters = {
      ['php-cs-fixer'] = {
        command = 'php-cs-fixer',
        args = {
          'fix',
          '--rules=@PSR12', -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          '$FILENAME',
          '--using-cache=no', -- Disable cache to avoid issues with file changes.
        },
        stdin = false,
      },
    },
    notify_on_error = true,
  },
}
