return {
  setup = function(configure)
    require("lspconfig").gopls.setup(configure())
  end,
}
