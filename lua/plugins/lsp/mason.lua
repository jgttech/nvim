return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = import.config(function(use)
    local ok, mason, mason_lspconfig, mason_tool_installer = use({
      "mason",
      "mason-lspconfig",
      "mason-tool-installer",
    })

    if ok then
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "lua_ls",
          "emmet_ls",
          "prismals",
          "pyright",
          "gopls",
          "jsonls",
          "yamlls",
          "bashls",
        },
        automatic_installation = true, -- not the same as ensure_installed
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "prismals",
          "isort",
          "black",
          "pylint",
          "eslint_d",
          "gopls",
          "golines",
          "goimports",
          "json-lsp",
          "shellcheck",
          "bash-language-server",
          "lua-language-server",
          "typescript-language-server",
          "yaml-language-server",
          "dockerfile-language-server",
          "docker-compose-language-service",
        },
      })
    end
  end),
}
