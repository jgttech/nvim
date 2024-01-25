return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier", "biome" },
        typescript = { "prettier", "biome" },
        javascriptreact = { "prettier", "biome" },
        typescriptreact = { "prettier", "biome" },
        css = { "prettier", "biome" },
        html = { "prettier", "biome" },
        json = { "prettier", "biome" },
        yaml = { "prettier", "biome" },
        markdown = { "prettier", "biome" },
        lua = { "stylua" },
        python = { "isort", "black" },
        tailwindcss = { "rustywind" },
        go = { "gofmt", "goimports" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fb", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
