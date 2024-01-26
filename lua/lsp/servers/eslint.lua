return {
  setup = function(args)
    local lspconfig = args.lspconfig

    lspconfig.eslint.setup({
      settings = {
        packageManager = "yarn",
      },
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufReadPre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
  end,
}
