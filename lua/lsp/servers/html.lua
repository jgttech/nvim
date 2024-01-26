return {
  setup = function(configure)
    require("lspconfig").html.setup(configure())
  end,
}
