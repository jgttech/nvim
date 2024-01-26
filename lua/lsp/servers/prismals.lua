return {
  setup = function(configure)
    require("lspconfig").prismals.setup(configure())
  end,
}
