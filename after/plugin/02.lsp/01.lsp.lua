local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server)
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end
  },
  ensure_installed = {
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
    'htmx',
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
  },
})
