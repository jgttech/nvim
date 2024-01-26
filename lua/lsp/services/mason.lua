return {
  setup = function()
    local config = require("lsp.config") or {}
    local lspconfig_ensure_installed = config["mason-lspconfig"].ensure_installed or {}
    local nonels_ensure_installed = config["mason-null-ls"].ensure_installed or {}

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = lspconfig_ensure_installed,
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({
      ensure_installed = lspconfig_ensure_installed,
      auto_update = true,
      run_on_start = true,
    })

    require("mason-null-ls").setup({
      ensure_installed = nonels_ensure_installed,
    })
  end,
}
