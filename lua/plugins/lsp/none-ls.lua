return {
  "nvimtools/none-ls.nvim", -- configure formatters & linters
  lazy = true,
  -- event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  config = import.config(function(use)
    local ok, mason_null_ls, null_ls, null_ls_utils = use({ "mason-null-ls", "null-ls", "null-ls.utils" })

    if ok then
      mason_null_ls.setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "black",
          "pylint",
          "eslint_d",
          "gofmt",
        },
      })

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      -- to setup format on save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- configure null_ls
      null_ls.setup({
        -- add package.json as identifier for root (for typescript monorepos)
        root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
        -- setup formatters & linters
        sources = {
          --  to disable file types use
          --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
          formatting.prettier,
          formatting.stylua,
          formatting.isort,
          formatting.black,
          diagnostics.pylint,
          diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", "eslint.config.js" })
            end,
          }),
        },
        -- configure format on save
        on_attach = function(current_client, bufnr)
          if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  filter = function(client)
                    --  only use null-ls for formatting instead of lsp server
                    return client.name == "null-ls"
                  end,
                  bufnr = bufnr,
                })
              end,
            })
          end
        end,
      })
    end
  end),
}
