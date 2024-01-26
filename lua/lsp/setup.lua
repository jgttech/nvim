-- This is the confguration for the "language-server-protocol.lua"
-- plugin that gets loaded. Because of the complex nature of setting
-- up LSP support, I decided to create a separate "lsp" module that
-- contains the entire LSP setup.

return {
  -- I decided to place the LSP scripts here so that I can
  -- manage them outside the logic of the configuration itself.
  -- This should automatically apply the scripts in the "lsp"
  -- directory for configuring each piece of the LSP, per-language.
  config = {
    servers = {
      "eslint",
      "jsonls",
      "lua_ls",
      "tailwindcss",
      "yamlls",
    },
  },
  mason = {
    ["mason-lspconfig"] = {
      ensure_installed = {
        "bashls",
        "biome",
        "cssmodules_ls",
        "denols",
        "diagnosticls",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "elixirls",
        "gopls",
        "html",

        -- Does not build, breaks when it gets to "cargo" on the M1 Macbook Pro
        -- 'htmx',

        "jsonls",
        "tsserver",
        "lua_ls",
        "marksman",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "taplo",
        "tailwindcss",
        "templ",
        "terraformls",
        "lemminx",
        "yamlls",
        "zls",
      },
    },
    ["mason-null-ls"] = {
      ensure_installed = {
        "prettier",
        "biome",
        "stylua",
        "black",
        "pylint",
        "eslint_d",
        "gofmt",
      },
    },
  },
}
