-- This configuration, according to the lsp-zero
-- documentation, should only be run AFTER the Lazy
-- plugin manager has been run.
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Options: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
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
  handlers = {
    lsp_zero.default_setup,
  },
})
