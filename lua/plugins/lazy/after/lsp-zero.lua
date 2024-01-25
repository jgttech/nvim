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
    'bash-language-server',
    -- 'cssmodules-language-server',
    -- 'deno',
    -- 'dockerfile-language-server',
    -- 'docker-compose-language-service',
    -- 'elixir-ls',
    -- 'goimports',
    -- 'gopls',
    -- 'html-lsp',
    -- 'biome',
    -- 'lua-language-server',
    -- 'marksman',
    -- 'prisma-language-server',
    -- 'pyright',
    -- 'taplo',
    -- 'tailwindcss-language-server',
    -- 'typescript-language-server',
    -- 'yaml-language-server',
    -- 'zls'
  },
  handlers = {
    lsp_zero.default_setup,
  },
})