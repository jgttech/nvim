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
      local lsp_zero = import("lsp-zero")
      local mason = import("mason")
      local mason_lspconfig = import("mason-lspconfig")
      local from_vscode = import("luasnip.loaders.from_vscode")
      local lspconfig = import("lspconfig")
      local cmp = import('cmp')

      -- LSP Zero configuration.
      if lsp_zero then
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

        -- Mason configuration
        if mason then
          mason.setup()
        end

        -- Mason LSP configuration
        if mason_lspconfig then
          mason_lspconfig.setup({
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
        end

        if lspconfig then
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnistics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "lua"] = true,
                  }
                }
              }
            }
          })
        end

        if cmp then
          local cmp_action = lsp_zero.cmp_action()

          cmp.setup({
            mapping = cmp.mapping.preset.insert({
              -- `Enter` key to confirm completion
              -- ['<CR>'] = cmp.mapping.confirm({select = false}),

              -- Confirm selection
              ['<leader>'] = cmp.mapping.confirm({ select = false }),

              -- Ctrl+Space to trigger completion menu
              ['<C-Space>'] = cmp.mapping.complete(),

              -- Navigate between snippet placeholder
              ['<C-f>'] = cmp_action.luasnip_jump_forward(),
              ['<C-b>'] = cmp_action.luasnip_jump_backward(),

              -- Scroll up and down in the completion documentation
              ['<C-u>'] = cmp.mapping.scroll_docs(-4),
              ['<C-d>'] = cmp.mapping.scroll_docs(4),
            })
          })
        end

        -- LuaSnip VS Code style code description,
        if from_vscode then
          from_vscode.lazy_load()
        end
      end
    end
  }
}
