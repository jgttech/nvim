-- Autoformat
return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { { 'prettier', 'biome' } },
      typescript = { { 'prettier', 'biome' } },
      javascriptreact = { { 'prettier', 'biome' } },
      typescriptreact = { { 'prettier', 'biome' } },
      css = { { 'prettier', 'biome' } },
      html = { { 'prettier', 'biome' } },
      json = { { 'prettier', 'biome' } },
      yaml = { { 'prettier', 'biome' } },
      markdown = { { 'prettier', 'biome' } },
      python = { { 'isort', 'black' } },
      tailwindcss = { { 'rustywind' } },
      go = { { 'gofmt', 'goimports' } },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}
