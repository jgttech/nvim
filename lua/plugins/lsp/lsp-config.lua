local from_options_with_buffer = function(bufnr)
  return function(desc)
    return {
      noremap = true,
      silent = true,
      buffer = bufnr,
      desc = desc,
    }
  end
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    "nvim-lua/plenary.nvim",
    "rafi/neoconf-venom.nvim",
  },
  config = import.config(function(use)
    local ok, lspconfig, cmp_nvim_lsp, venom = use({ "lspconfig", "cmp_nvim_lsp", "venom" })

    if ok then
      venom.setup()

      local on_attach = function(_, bufnr)
        local options = from_options_with_buffer(bufnr)

        keymap({
          { "n", "gR", "<cmd>Telescope lsp_references<cr>", options("Show LSP references") },
          { "n", "gD", vim.lsp.buf.declaration, options("Go to declaration") },
          { "n", "gd", "<cmd>Telescope lsp_definitions<cr>", options("Show LSP definitions") },
          { "n", "gi", "<cmd>Telescope lsp_implementations<cr>", options("Show LSP implementations") },
          { "n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", options("Show LSP type definitions") },
          { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options("See available code actions") },
          { "n", "<leader>rn", vim.lsp.buf.rename, options("Smart rename") },
          { "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options("Show buffer diagnostics") },
          { "n", "<leader>d", vim.diagnostic.open_float, options("Show line diagnostics") },
          { "n", "[d", vim.diagnostic.goto_prev, options("Go to previous diagnostic") },
          { "n", "]d", vim.diagnostic.goto_next, options("Go to next diagnostic") },
          { "n", "K", vim.lsp.buf.hover, options("Show documentation for what is under cursor") },
          { "n", "<leader>rs", ":LspRestart<CR>", options("Restart LSP") },
        })
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()
      local server_setup = { capabilities = capabilities, on_attach = on_attach }
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      lspconfig.html.setup(server_setup)
      lspconfig.tsserver.setup(server_setup)
      lspconfig.cssls.setup(server_setup)
      lspconfig.tailwindcss.setup(server_setup)
      lspconfig.prismals.setup(server_setup)
      lspconfig.gopls.setup(server_setup)
      lspconfig.pyright.setup(server_setup)
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "\\$`([^`]*)", -- $`...`
                "classes`([^`]*)", -- classes`...`
                'tw="([^"]*)', -- <div tw="..." />
                "tw='([^']*)", -- <div tw='...' />
                'tw={"([^"}]*)', -- <div tw={"..."} />
                "tw={'([^'}]*)", -- <div tw={'...'} />
                "tw={`([^`}]*)", -- <div tw={`...`} />
                'className="([^"]*)', -- <div className="..." />
                "className='([^']*)", -- <div className='...' />
                'className={"([^"}]*)', -- <div className={"..."} />
                "className={'([^'}]*)", -- <div className={'...'} />
                "className={`([^`}]*)", -- <div className={`...`} />
              },
            },
          },
        },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end
  end),
}
