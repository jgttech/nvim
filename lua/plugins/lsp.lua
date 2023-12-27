return {
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'j-hui/fidget.nvim',
    config = function()
      local fidget = import("fidget")

      if fidget then
        fidget.setup()
      end
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/nvim-cmp' },
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          'rafamadriz/friendly-snippets'
        }
      },
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }
        lsp_zero.default_keymaps({ buffer = bufnr })

        keymap({
          { "n", "gd",          function() vim.lsp.buf.definition() end,       opts },
          { "n", "K",           function() vim.lsp.buf.hover() end,            opts },
          { "n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts },
          { "n", "<leader>vd",  function() vim.diagnostic.open_float() end,    opts },
          { "n", "[d",          function() vim.diagnostic.goto_next() end,     opts },
          { "n", "]d",          function() vim.diagnostic.goto_prev() end,     opts },
          { "n", "<leader>ca",  function() vim.lsp.buf.code_action() end,      opts },
          { "n", "<leader>rr",  function() vim.lsp.buf.references() end,       opts },
          { "n", "<leader>rn",  function() vim.lsp.buf.renamed() end,          opts },
          { "n", "C-h",         function() vim.lsp.buf.signature_help() end,   opts },
        })
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
          'gopls',
          'eslint',
          'jsonls',
          'pyright',
          'tailwindcss',
          'tsserver',
          'html',
          'denols'
        },
        handlers = {
          lsp_zero.default_setup
        },
      })

      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }
}
