return {
  setup = function(configure)
    require("lspconfig").cssls.setup(configure())
  end,
}
