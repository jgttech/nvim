-- This configuration, according to the lsp-zero
-- documentation, should only be run AFTER the Lazy
-- plugin manager has been run.
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lap_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Options: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
  ensure_installed = {
    'bashls',
    'cssls',
    'denols',
    'dockerls',
    'docker_compose_language_service',
    'elixirls',
    'gopls',
    'html',
    'biome',
    'lua_ls',
    'marksman',
    'prismals',
    'pyright',
    'taplo',
    'tailwindcss',
    'tsserver',
    'yamlls',
    'zls'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})