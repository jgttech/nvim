local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local ensure_installed = {
  'bashls',
  'cssmodules_ls',
  'denols',
  'diagnosticls',
  'dockerls',
  'docker_compose_language_service',
  'eslint',
  'elixirls',
  'gopls',
  'html',
  -- 'htmx',
  'biome',
  'tsserver',
  'lua_ls',
  'marksman',
  'pyright',
  'rust_analyzer',
  'sqlls',
  'taplo',
  'tailwindcss',
  'templ',
  'terraformls',
  'lemminx',
  'yamlls',
  'zls',
}

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = ensure_installed,
  automatic_installation = true,
  handlers = {
    function(server)
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end
  },
})

require('mason-tool-installer').setup({
  ensure_installed = ensure_installed,
  auto_update = true,
  run_on_start = true
})

require('mason-null-ls').setup({
  ensure_installed = {
    "prettier",
    "biome",
    "stylua",
    "black",
    "pylint",
    "eslint_d",
    "gofmt",
  }
})
