return {
  setup = function(eslint, configure)
    eslint.setup(configure({
      settings = {
        packageManager = "yarn",
      },
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufReadPre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    }))
  end,
}
