-- Autoformat
return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require 'conform'

    conform.setup {
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
      },
      format_on_save = {
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      },
    }

    vim.keymap.set('n', '<leader>fb', function()
      conform.format {
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
