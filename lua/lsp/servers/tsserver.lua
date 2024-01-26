return {
  setup = function(configure)
    require("lspconfig").tsserver.setup(configure())
  end,
}
