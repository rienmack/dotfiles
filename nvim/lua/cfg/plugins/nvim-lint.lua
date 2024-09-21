return {
  'mfussenegger/nvim-lint',
  optional = true,
  opts = {
    linters_by_ft = {
      php = { 'phpcs' },
      go = { 'golangci-lint' },
    },
  },
}
